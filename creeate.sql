-- SHOW VARIABLES LIKE 'secure_file_priv';
-- run once to discover valid upload folder
-- once found, please copy manually all CSV files to directory, eg may be:
-- C:\ProgramData\MySQL\MySQL Server 5.7\Uploads\


CREATE SCHEMA IF NOT EXISTS fiction;

USE fiction;

DELIMITER $$
DROP FUNCTION  IF EXISTS `proper_case`;
CREATE FUNCTION `proper_case`(name VARCHAR(128)) RETURNS VARCHAR(128)
BEGIN
RETURN concat ( upper(substring(name,1,1)), lower(right(name,length(name)-1)));
END
$$
DELIMITER ;

DROP TABLE IF EXISTS got;
CREATE TABLE got (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    release_date DATE NOT NULL,
    season VARCHAR(16) NOT NULL,
    episode VARCHAR(16) NOT NULL,
    episode_title VARCHAR(64) NOT NULL,
    name_full VARCHAR(32) NOT NULL,
    sentence VARCHAR(2048) NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/game_of_thrones/game-of-thrones-script-all-seasons/Game_of_Thrones_Script.csv'
    INTO TABLE got
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES -- ;
(@release_date, season, episode, episode_title, @name_full, sentence)
SET
    release_date = STR_TO_DATE(@release_date, '%Y-%m-%d'),
    name_full = proper_case(@name_full);
