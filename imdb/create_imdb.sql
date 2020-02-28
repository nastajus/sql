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






-- so... IMDB table NAME_BASICS had some challenges to load... it failed repeatedly when using VARCHAR, but I wanted VARCHAR > TEXT for certain size-counting benefits...
-- so... i was able to load fully as TEXT and then ALTER to be VARCHAR... but the 15 minutes + trial/error wasn't worth it in hindsight.
-- anyways, i still have duplicates, so... i dunno why, but that data is full of duplicates...

DROP TABLE IF EXISTS name_basics;
CREATE TABLE name_basics (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nconst TEXT, -- VARCHAR(10),
    primaryName TEXT, -- VARCHAR(128),
    birthYear INT,
    deathYear INT,
    primaryProfession TEXT, -- VARCHAR(128),
    knownForTitles TEXT  -- VARCHAR(128),
    -- UNIQUE KEY ix_name_basics (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)
);

-- clearly has duplicates often from very beginning... leaving for now...
LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/name.basics.tsv/name.basics.tsv' IGNORE
    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/ ... .csv'
    INTO TABLE name_basics
    -- CHARACTER SET utf8
    FIELDS TERMINATED BY '\t' -- OPTIONALLY ENCLOSED BY '"' -- noooo~!!
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


select * from imdb.name_basics;

select * from information_schema.COLUMNS where TABLE_SCHEMA = 'imdb';

select nconst, count(nconst) c, primaryName, knownForTitles from name_basics
where birthYear > 1980
group by nconst -- having c > 2
limit 100;

select primaryName, (char_length(primaryName)) from name_basics; -- okay.
select avg(char_length(primaryName)) from name_basics; -- 13.5081
select stddev(char_length(primaryName)) from name_basics; -- 3.3352891132917413
select variance(char_length(primaryName)) from name_basics; -- 11.12415346924241


select count(char_length(primaryName)), char_length(primaryName) from name_basics; -- 16352122	12  -- umm... weird... okay..
select count(char_length(primaryName)) from name_basics group by char_length(primaryName);
select count(char_length(primaryName)),char_length(primaryName) from name_basics group by char_length(primaryName); -- interesting... okay... cool..
select count(char_length(primaryProfession)),char_length(primaryProfession) from name_basics group by char_length(primaryProfession); -- interesting... okay... cool..
select count(char_length(knownForTitles)),char_length(knownForTitles) from name_basics group by char_length(knownForTitles); -- interesting... okay... cool..


SELECT MAX(id) FROM imdb.name_basics; -- 16352122 with dupes.


select max(id), id from name_basics group by id;

-- well.. technically could work, but ... join on self of a gigabyte of data seems will take horribly long
delete nb1
-- select *
from name_basics nb1
inner join name_basics nb2
where nb1.id < nb2.id and
      nb1.primaryName = nb2.primaryName and
      nb1.birthYear = nb2.birthYear and
      nb1.deathYear = nb2.deathYear and
      nb1.primaryProfession = nb2.primaryProfession and
      nb1.knownForTitles = nb2.knownForTitles;
-- limit 10;


create table name_basics_v2 like name_basics;

INSERT INTO name_basics_v2 (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)
SELECT nb1.nconst, nb1.primaryName, nb1.birthYear, nb1.deathYear, nb1.primaryProfession, nb1.knownForTitles FROM name_basics nb1
inner join name_basics nb2
where nb1.id < nb2.id and
      nb1.primaryName = nb2.primaryName and
      nb1.birthYear = nb2.birthYear and
      nb1.deathYear = nb2.deathYear and
      nb1.primaryProfession = nb2.primaryProfession and
      nb1.knownForTitles = nb2.knownForTitles;


SELECT * FROM name_basics WHERE id > 4 ORDER BY id LIMIT 1;






DROP TABLE name_basics_test;
CREATE TABLE name_basics_test LIKE name_basics;

INSERT INTO name_basics_test SELECT * FROM name_basics; -- limit 500; -- okay, works. cool.
-- 10 minutes later [HY000][1206] The total number of locks exceeds the lock table size .... when i had 6 MB!~
-- 2 minutes later it succeeded when it was set to 3GB in my.ini and restarted the service mysql57.



-- attempted this query to get "innodb_buffer_pool_size" but couldn't be bothered to change settings
-- [HY000][3167] The 'INFORMATION_SCHEMA.GLOBAL_VARIABLES' feature is disabled; see the documentation for 'show_compatibility_56'
SELECT variable_value FROM information_schema.global_variables WHERE variable_name = 'innodb_buffer_pool_size';

-- get interesting data on various details on the tables in a schema. cool.  rows + avg_row_length in particular
SHOW TABLE status FROM imdb;





-- help to discover ideal size to set your database to actually perform this update without failing.
-- run this ti determine number of gigabytes to set innodb_buffer_pool_size to in my.ini / my.cnf.
SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) RIBPS FROM
(SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
FROM information_schema.tables WHERE engine='InnoDB') A;
-- output was "6"  --> which means set my innodb_buffer_pool_size to "6GB" in my "my.ini" file (my.cnf on unix).



ALTER IGNORE TABLE name_basics_test ADD UNIQUE (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles);

select * from information_schema.STATISTICS where TABLE_SCHEMA = 'imdb';


-- took 17 minutes to finish ~1 GB of unique migrating. cool.
INSERT INTO name_basics_v2
SELECT * FROM name_basics_test GROUP BY nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles; -- 6 minutes to check

