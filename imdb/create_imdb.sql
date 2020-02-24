-- SHOW VARIABLES LIKE 'secure_file_priv';


CREATE SCHEMA IF NOT EXISTS imdb;
USE imdb;

DROP TABLE IF EXISTS title_akas;
CREATE TABLE title_akas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titleId TEXT NOT NULL, -- tt0000001
    ordering TEXT,
    title TEXT,
    region VARCHAR(8),
    language TEXT,
    types TEXT,
    attributes TEXT,
    isOriginalTitle BOOLEAN -- NOT NULL
);

LOAD DATA INFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/title.akas.utf8.tsv' IGNORE
    -- 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/game_of_thrones/game-of-thrones-script-all-seasons/Game_of_Thrones_Script.csv'
    INTO TABLE title_akas
     CHARACTER SET utf8
    FIELDS TERMINATED BY '\t' -- OPTIONALLY ENCLOSED BY '"' -- noooo~!!
    LINES TERMINATED BY '\n'
     IGNORE 1 LINES
    -- IGNORE 16203154 LINES -- CONTINUE HERE    -- 16203154 + 1 = 16203155
    -- IGNORE 19699952 LINES
(titleId, ordering, title, region, language, types, attributes, isOriginalTitle);
-- [01000][1261] Row 16203154 doesn't contain data for all columns
-- [01000][1261] Row 3496798 doesn't contain data for all columns ... umm... 19699952

select * from imdb.title_akas where title like '%star trek%' and region = 'US';

select titleId, ordering, title, region, language, types, attributes, isOriginalTitle from imdb.title_akas where title like '%star trek%'
INTO OUTFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/star-trek.tsv';

select * from imdb.title_akas where title like '%star trek%' and region = 'US';

select titleId, ordering, title from imdb.title_akas where title like '%star trek%' and region in ('US', '\\N')
INTO OUTFILE 'D:/[[TO QUERY]]/IMDb/[2020-02-22]/title.akas.tsv/star-trek-us.tsv';



select * from imdb.title_akas where id in ( 16203151, 16203152, 16203153, 16203154 );
-- Épisode #2.2
-- Folge #2.2
-- Episodio #2.2


SELECT MAX(id) FROM imdb.title_akas;
-- 16203154 yes this one...
-- 19699952 oh man... new latest issue.


select * from imdb.title_akas
where id in
      (
           ((SELECT MAX(id) FROM imdb.title_akas) - 3),
           ((SELECT MAX(id) FROM imdb.title_akas) - 2),
           ((SELECT MAX(id) FROM imdb.title_akas) - 1),
           ((SELECT MAX(id) FROM imdb.title_akas) - 0)
      );


-- DELETE FROM imdb.title_akas WHERE ID = 16203154;
-- WORKED.


SELECT table_catalog, table_schema, table_name, column_name, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH
FROM INFORMATION_SCHEMA.columns
WHERE table_name = 'title_akas';
