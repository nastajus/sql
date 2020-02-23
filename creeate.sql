-- SHOW VARIABLES LIKE 'secure_file_priv';
-- run once to discover valid upload folder
-- once found, please copy manually all CSV files to directory, eg may be:
-- C:\ProgramData\MySQL\MySQL Server 5.7\Uploads\


CREATE SCHEMA IF NOT EXISTS fiction;
USE fiction;

DELIMITER $$
DROP FUNCTION  IF EXISTS `proper_case`;
CREATE FUNCTION `proper_case`(str VARCHAR(128)) RETURNS VARCHAR(128)
BEGIN

    DECLARE n, pos INT DEFAULT 1;
    DECLARE sub, proper VARCHAR(128) DEFAULT '';

    if length(trim(str)) > 0 then
        WHILE pos > 0 DO
            set pos = locate(' ',trim(str),n);
            if pos = 0 then
                set sub = lower(trim(substr(trim(str),n)));
            else
                set sub = lower(trim(substr(trim(str),n,pos-n)));
            end if;

            set proper = concat_ws(' ', proper, concat(upper(left(sub,1)),substr(sub,2)));
            set n = pos + 1;
        END WHILE;
    end if;

    return trim(proper);
END
$$

DELIMITER ;


-- game of thrones
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
    IGNORE 1 LINES
(@release_date, season, episode, episode_title, @name_full, sentence)
SET
    release_date = STR_TO_DATE(@release_date, '%Y-%m-%d'),
    name_full = proper_case(@name_full);



-- rick and morty
DROP TABLE IF EXISTS ram;
CREATE TABLE ram (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season_no VARCHAR(2) NOT NULL,
    episode_no VARCHAR(2) NOT NULL,
    episode_name VARCHAR(64) NOT NULL,
    name_desc VARCHAR(32) NOT NULL,
    line VARCHAR(2048) NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/rick_and_morty/rickmorty-scripts/RickAndMortyScripts.csv'
    INTO TABLE ram
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
 (@skip, season_no, episode_no, episode_name, name_desc, line);




-- kung fu panda

DELIMITER $$
DROP FUNCTION  IF EXISTS `extract_name`;
CREATE FUNCTION `extract_name`(name_and_line VARCHAR(2048)) RETURNS VARCHAR(2048)
BEGIN
    RETURN substring_index(`name_and_line`,':',1); -- first value
END
$$

DROP FUNCTION  IF EXISTS `extract_line`;
CREATE FUNCTION `extract_line`(name_and_line VARCHAR(2048)) RETURNS VARCHAR(2048)
BEGIN
    RETURN substring_index(substring_index(`name_and_line`,':',-2),':',1); -- second value
END
$$

DELIMITER ;


DROP TABLE IF EXISTS kfp;
CREATE TABLE kfp (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    film_no VARCHAR(2) NOT NULL,
    who VARCHAR(2048), -- NOT NULL,
    line VARCHAR(2048) -- NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/kung_fu_panda/kung-fu-panda/KFP1Script.csv'
    INTO TABLE kfp
    -- CHARACTER SET latin1 -- works until line 78 + 5 around " standing — poised — ready "
    -- CHARACTER SET utf8mb4 -- fails right away
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 5 LINES -- 4
 (@row)
-- SET
-- INTO TABLE kpf
SET
    film_no = '1',
    who = extract_name(@row),
    line = extract_line(@row);