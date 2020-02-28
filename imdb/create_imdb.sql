-- SHOW VARIABLES LIKE 'secure_file_priv';


CREATE SCHEMA IF NOT EXISTS imdb;
USE imdb;

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

LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/title.akas.utf8.tsv' IGNORE
    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/ ... .csv'
    INTO TABLE title_akas
    CHARACTER SET utf8
    FIELDS TERMINATED BY '\t' -- OPTIONALLY ENCLOSED BY '"' -- noooo~!!
    LINES TERMINATED BY '\n'
     IGNORE 1 LINES
(titleId, ordering, title, region, language, types, attributes, isOriginalTitle);



select titleId, ordering, title, region
from imdb.title_akas
where title like '%star trek%' and (region in ('US', '\\N') or region is NULL)
INTO OUTFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/star-trek-us.tsv';


SELECT MAX(id) FROM imdb.title_akas;

select * from imdb.title_akas
where id in
      (
           ((SELECT MAX(id) FROM imdb.title_akas) - 3),
           ((SELECT MAX(id) FROM imdb.title_akas) - 2),
           ((SELECT MAX(id) FROM imdb.title_akas) - 1),
           ((SELECT MAX(id) FROM imdb.title_akas) - 0)
      );





-- help to discover ideal size to set your database to actually perform this update without failing.
-- run this ti determine number of gigabytes to set innodb_buffer_pool_size to in my.ini / my.cnf.
SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) RIBPS FROM
(SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
FROM information_schema.tables WHERE engine='InnoDB') A;
-- output was "6"  --> which means set my innodb_buffer_pool_size to "6GB" in my "my.ini" file (my.cnf on unix).





-- so... IMDB table NAME_BASICS had some challenges to load... it failed repeatedly when using VARCHAR, but I wanted VARCHAR > TEXT for certain size-counting benefits...
-- so... i was able to load fully as TEXT and then ALTER to be VARCHAR... but the 15 minutes + trial/error wasn't worth it in hindsight.
-- anyways, i still have duplicates, so... i dunno why, but that data is full of duplicates...

DROP TABLE IF EXISTS name_basics;
CREATE TABLE name_basics (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nconst VARCHAR(10),
    primaryName VARCHAR(128),
    birthYear INT,
    deathYear INT,
    primaryProfession VARCHAR(128),
    knownForTitles VARCHAR(128),


    -- this was valid only with VARCHAR and not TEXT, but i had errors loading with VARCHAR directly...
    -- possibly could've avoided all the following queries by addressing that original error.
    -- suspect i just needed to boost `innodb_buffer_pool_size` from default 8 MB to ~ some GB in hindsight.

    UNIQUE KEY ix_name_basics (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)
);

-- 5 minutes, works with good settings ! YAY.
-- ok so... i tried loading with the unique index.. but i still get dupes.. just less.


-- clearly has duplicates often from very beginning... leaving for now...
LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/name.basics.tsv/name.basics.tsv' IGNORE
    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/ ... .csv'
    INTO TABLE name_basics
    -- CHARACTER SET utf8
    FIELDS TERMINATED BY '\t'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(nconst, primaryName, @vbirthYear, @vdeathYear, primaryProfession, knownForTitles)
SET
    birthYear = nullif(@vbirthYear, '\\N'),
    deathYear = nullif(@vdeathYear, '\\N');

ALTER TABLE name_basics MODIFY nconst VARCHAR(10);
ALTER TABLE name_basics MODIFY primaryName VARCHAR(128);
ALTER TABLE name_basics MODIFY primaryProfession VARCHAR(128);
ALTER TABLE name_basics MODIFY knownForTitles VARCHAR(128);


SELECT MAX(id) FROM imdb.name_basics; -- 16352122 with dupes.
select max(id), id from name_basics group by id; -- found 1's and 2's exclusively everywhere... the heck.


-- due to the massively high number of duplicates in IMDb's name_basics, a new table will be used to filter out uniques.
create table name_basics_v2 like name_basics;


-- attempted this query to get "innodb_buffer_pool_size" but couldn't be bothered to change settings
-- [HY000][3167] The 'INFORMATION_SCHEMA.GLOBAL_VARIABLES' feature is disabled; see the documentation for 'show_compatibility_56'
SELECT variable_value FROM information_schema.global_variables WHERE variable_name = 'innodb_buffer_pool_size';

-- get interesting data on various details on the tables in a schema. cool.  rows + avg_row_length in particular
SHOW TABLE status FROM imdb;







select * from information_schema.STATISTICS where TABLE_SCHEMA = 'imdb';


-- took 17 minutes to finish ~1 GB of unique migrating. cool.
INSERT INTO name_basics_v2
SELECT * FROM name_basics GROUP BY nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles; -- 6 minutes to check just select



ALTER TABLE name_basics_v2
    -- DROP PRIMARY KEY,
    ADD idd INT PRIMARY KEY AUTO_INCREMENT FIRST ;
-- above combo failed:
-- [42000][1075] Incorrect table definition; there can be only one auto column and it must be defined as a key
-- i wanna drop  AUTO_INCREMENT
-- ok so do this instead:

ALTER TABLE name_basics_v2 MODIFY id INT NOT NULL ;
ALTER TABLE name_basics_v2  DROP PRIMARY KEY;

-- ALTER TABLE table_name RENAME COLUMN old_col_name TO new_col_name;
ALTER TABLE name_basics_v2 RENAME COLUMN id TO idd;
-- [42000][1064] You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COLUMN id TO idd' at line 1
-- ALTER TABLE `records` CHANGE `student_id` `id` INT NOT NULL;
ALTER TABLE `name_basics_v2` CHANGE `id` `idd` INT NOT NULL;
ALTER TABLE name_basics_v2 CHANGE idd id INT NOT NULL;
-- sigh. good. that worked. back and forth both, with and without backticks.

ALTER TABLE name_basics_v2 ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST ;
ALTER TABLE name_basics_v2 DROP idd;

DROP TABLE IF EXISTS name_basics;
RENAME TABLE name_basics_v2 TO name_basics_clean;

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

-- i made an assumption about how unique key worked
-- i'd assumed by just adding a all the columns in one gigantic list it'll maximize uniqueness...
-- and i was further validated by my initial dependence on the first entries only checked...
-- but in reality the 90% still slipped through, just, passed the first 100 entries... so... ya... somehow misses tons still.
-- UNIQUE KEY ix_name_basics (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)
-- okay, this is why:
-- https://stackoverflow.com/questions/41014240/mysql-unique-key-does-not-work
