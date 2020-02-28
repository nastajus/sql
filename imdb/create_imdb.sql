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


-- so... the imdb name_basics dataset  full of duplicates... okay... time to eliminate...

-- delete
-- from employee using employee,
--     employee e1
-- where employee.id > e1.id
--     and employee.first_name = e1.first_name

-- select *
-- from imdb.name_basics using imdb.name_basics as nb
-- where imdb.name_basics.id > nb.id
--     and imdb.name_basics.nconst = nb.nconst
-- limit 10;

-- SELECT MAX(ID) FROM t GROUP BY unique and then JOIN to an exact match of ID to MAX(ID)?
-- select max(id) from name_basics group by -- unique;
select max(id), id from name_basics group by id;


SELECT
    primaryName, COUNT(primaryName)
FROM
    name_basics
GROUP BY
    primaryName
HAVING
    COUNT(primaryName) > 1
limit 10;


DELETE t1 FROM contacts t1
INNER JOIN contacts t2
WHERE
    t1.id < t2.id AND
    t1.email = t2.email;


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




DROP PROCEDURE IF EXISTS remove_adjacent_duplicate_rows;
DELIMITER ;;

CREATE PROCEDURE remove_adjacent_duplicate_rows()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM name_basics INTO n;
SET i=0;
WHILE i<n DO
  INSERT INTO name_basics_v2 (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles)  -- (ID, VAL)  -- SELECT (ID, VAL) FROM name_basics LIMIT i,1;
  SELECT (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles) FROM name_basics WHERE id > i ORDER BY id LIMIT 1;
  -- nah, this will fail logically. at each i it will still insert...
  SET i = i + 1;
END WHILE;
End;
;;


DROP TABLE name_basics_test;
CREATE TABLE name_basics_test LIKE name_basics;

INSERT INTO name_basics_test SELECT * FROM name_basics; -- limit 500; -- okay, works. cool.
-- 10 minutes later [HY000][1206] The total number of locks exceeds the lock table size .... when i had 6 MB!~
-- 2 minutes later it succeeded when it was set to 3GB in my.ini and restarted the service mysql57.


SELECT FLOOR(SUM(data_length+index_length)/POWER(1024,2)) InnoDBSizeMB
FROM information_schema.tables WHERE engine='InnoDB';

SELECT variable_value FROM information_schema.global_variables WHERE variable_name = 'innodb_buffer_pool_size';

SHOW TABLE status FROM imdb;




SET @PowerOfTwo = 2;
SET @GivenDB = 'imdb';
SET @GivenTB = 'name_basics';
SELECT COUNT(1) INTO @MyRowCount FROM imdb.name_basics;
SELECT
    index_name,SUM(column_length * @MyRowCount) indexentry_length
FROM
(
    SELECT
        index_name,column_name,
        IFNULL(character_maximum_length,
        IF(data_type='double',8,
        IF(data_type='bigint',8,
        IF(data_type='float',4,
        IF(data_type='int',4,
        IF(data_type='mediumint',3,
        IF(data_type='smallint',2,
        IF(data_type='datetime',4,
        IF(data_type='date',3,
        IF(data_type='tinyint',1,1)
        ))))))))
    ) / POWER(1024,@PowerOfTwo) column_length
FROM
(
    SELECT
        AAA.index_name,AAA.column_name,
        BBB.data_type,coalesce(AAA.sub_part,BBB.character_maximum_length) AS character_maximum_length
        FROM
        (
            SELECT table_schema,table_name,index_name,column_name,sub_part
            FROM information_schema.statistics
            WHERE table_schema = @GivenDB AND table_name = @GivenTB
        ) AAA INNER JOIN
        (
            SELECT
                table_schema,table_name,column_name,
                character_maximum_length,data_type
            FROM information_schema.columns
            WHERE table_schema = @GivenDB AND table_name = @GivenTB
        ) BBB USING (table_schema,table_name,column_name)
    ) AA
) A GROUP BY index_name;



SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) RIBPS FROM
(SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
FROM information_schema.tables WHERE engine='InnoDB') A;
-- 6 --> 6GB!! okay! haha nice..



ALTER IGNORE TABLE name_basics_test ADD UNIQUE (nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles);

select * from information_schema.STATISTICS where TABLE_SCHEMA = 'imdb';


INSERT INTO name_basics_v2
SELECT * FROM name_basics_test GROUP BY nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles; -- 6 minutes to check