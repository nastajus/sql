-- SHOW VARIABLES LIKE 'secure_file_priv';
-- once run, please copy manually all CSV files to directory, eg may be:
-- C:\ProgramData\MySQL\MySQL Server 5.7\Uploads\


CREATE SCHEMA IF NOT EXISTS fiction;

USE fiction;

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

-- LOAD DATA INFILE 'c:/tmp/discounts.csv'
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/scripts/game_of_thrones/game-of-thrones-script-all-seasons/Game_of_Thrones_Script.csv'
    INTO TABLE got
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES -- ;
-- IGNORE 1 ROWS;
-- (@c1, c2, c3, c4, c5, c6);
-- (@c1);
-- (@release_date)
(@release_date, season, episode, episode_title, name_full, sentence)
-- SET release_date = convert_excel_serial_number_to_date_time(@release_date);
SET release_date = STR_TO_DATE(@release_date, '%Y-%m-%d');
