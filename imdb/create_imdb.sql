--  IMDb data format specification : https://www.imdb.com/interfaces/
--  IMDb data source download :      https://datasets.imdbws.com/
--  download everything from there.
--  Total compressed download size:  ~ 0.65 GB
--  Total uncompressed size:         ~ 3.65 GB

-- reminder where to actually put your CSV files to actually be found to load.
SHOW VARIABLES LIKE 'secure_file_priv';

CREATE SCHEMA IF NOT EXISTS imdb;
USE imdb;

-- helper to get useful details on the tables in a schema. Particularly `rows` & `avg_row_length`.
-- However it is only an approximation, and have observed errors ranging 0.001 % to 3.63 %
-- Hence was formerly favored when huge gaps were obvious, but with smaller gaps it's better to rely on count(*) instead.
SHOW TABLE status FROM imdb;

-- another helper query, check out `cardinality`.
select * from information_schema.STATISTICS where TABLE_SCHEMA = 'imdb';



-- helper command-line to help evaluate long query duration (read very end parts to see ~rows/second rates)
-- MYSQL>   SHOW ENGINE INNODB STATUS \G


DROP TABLE IF EXISTS title_akas;
CREATE TABLE title_akas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titleId TEXT NOT NULL,
    ordering TEXT,
    title TEXT,
    region VARCHAR(8),
    language TEXT,
    types TEXT,
    attributes TEXT,
    isOriginalTitle BOOLEAN
);

-- convert raw IMBd downloaded CSV to UTF8 first using Notepad++ or KainetEditor for example.
LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/title.akas.utf8.tsv' IGNORE
    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/ ... .csv'
    INTO TABLE title_akas
    CHARACTER SET utf8
    FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(titleId, ordering, title, region, language, types, attributes, isOriginalTitle);

analyze table title_akas; -- can help improve accuracy of `status` query.



-- At this point it gets increasingly difficult to successfully load the large IMBd datasets without critical failure.
-- Especially if default MySQL 8 MB pool size from installation is left alone.
-- The fact the above `title_akas` succeeded is perhaps by pure coincidence my system had enough strength.

-- To help to discover ideal size to set your pool size to actually perform this update without failing,
-- run this to determine number of gigabytes to set innodb_buffer_pool_size to in my.ini / my.cnf.
-- You may have to create this file for the first time.
-- On my Windows it goes at `C:\ProgramData\MySQL\MySQL Server 5.7\my.ini`.
-- On Unix-based systems I'm unsure where, but the convention uses `my.cnf`.
SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) RIBPS FROM
(SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
FROM information_schema.tables WHERE engine='InnoDB') A;
-- output was "6"  --> which means set my innodb_buffer_pool_size to "6GB" in my "my.ini" file (my.cnf on unix).
-- however given my RAM limitations I see realistically I could only give "3GB" which worked well,
-- otherwise paging thrashing would've tanked performance significantly which is perhaps worse than a tiny buffer.







-- `name.basics.tsv` has some challenges to load cleanly.
-- First, must increase default mysql pool size to from megabytes to gigabytes, or will likely fail critically to load.
-- Second, understand ~41% entries from the raw CSV download are duplicates.
-- so some additional filtering operations are necessary.
-- Third, finally, unfortunately just using `UNIQUE KEY` alone is insufficient to filter out ~90% of duplicates,
-- due to nulls being considered by design as "unique" and most actors birthYear being null.
-- Therefore NOT NULL is included on as well on the 3 columns : birthYear, deathYear, and knownForTitles.
-- Fourth, the order of `nconst` is 10% misordered due to string-based sorting. However this is simply ignored.

DROP TABLE IF EXISTS name_basics_test3;
CREATE TABLE name_basics_test3 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    -- looks fine for now, but might be too small ... soon or eventually.
    nconst VARCHAR(10),
    primaryName VARCHAR(128),

    -- Raw "\N" will be read as <null>, and converted implicitly to default of varchar, which is <empty>.
    -- As long as strict mode isn't used, otherwise those records would produce errors and fail to load.
    -- The <empty> state is desirable for constraint `UNIQUE KEY` below to work:
    -- together both NOT NULL combined with UNIQUE KEY (...) prevents the actual duplicates from loading,
    -- as <null> is considered unique, but <empty> is not.
    birthYear VARCHAR(4) NOT NULL,
    deathYear VARCHAR(4) NOT NULL,

    -- interestingly, this column actually exports truly <empty> instead as '\N' (<null>). So no need.
    primaryProfession VARCHAR(128),

    knownForTitles VARCHAR(128) NOT NULL,


    -- This was valid only with VARCHAR and not TEXT, but i had errors loading with VARCHAR directly...
    -- Suspect i just needed to boost `innodb_buffer_pool_size` from default 8 MB to ~ some GB in hindsight.

    -- Alone this still fails to filter 90% of duplicates due to nulls being considered unique by design.
    -- The remaining duplicates would all contain a null field, usually deathYear.
    -- Together with NOT NULL above, these work together to effectively filter out all duplicates.

    UNIQUE KEY ix_name_basics (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)
);





-- Takes about 5 minutes to load this gigabyte. Cool.
LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/name.basics.tsv/name.basics.tsv' IGNORE
-- LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/name.basics.tsv/split500.name.basics.tsvaa' IGNORE    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/ ... .csv'
    INTO TABLE name_basics_test3
    -- CHARACTER SET utf8
    FIELDS TERMINATED BY '\t'
    -- ESCAPED BY '\\' -- seemingly does nothing.
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles);

analyze table name_basics_test3; -- can help improve accuracy of `status` query.






select count(*) from (
SELECT *, count(nconst) as c
FROM name_basics
GROUP BY nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles
having c > 1
) as cc; -- result is 6338674 dupes still found, and in only 30 seconds!


-- 16352122 entries loaded raw with dupes.
-- 15847335 entries loaded with unique key filter...
--  6338674 dupes still found after unique key filter...
--        0 dupes found in "_clean" table...
--  9771478 entries in clean table...
        -- biggest id : 9908614,  nconst: nm9993719

--  9898499 entries in test3 ... very close now... almost perfect...
        -- biggest id : 9908614,  nconst: nm9993719




-- extract small subset of data, cool.
select titleId, ordering, title, region
from imdb.title_akas
where title like '%star trek%' and (region in ('US', '\\N') or region is NULL)
INTO OUTFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/star-trek-us.tsv';
