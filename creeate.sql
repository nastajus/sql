
CREATE SCHEMA IF NOT EXISTS fiction;

CREATE TABLE got (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    release_date DATE NOT NULL,
    season VARCHAR(16) NOT NULL,
    episode VARCHAR(16) NOT NULL,
    episode_title VARCHAR(32) NOT NULL,
    name VARCHAR(32) NOT NULL,
    sentence VARCHAR(2048) NOT NULL
);

-- LOAD DATA INFILE 'c:/tmp/discounts.csv'
LOAD DATA INFILE 'scripts/game_of_thrones/game-of-thrones-script-all-seasons/Game_of_Thrones_Script.csv'
    INTO TABLE got
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
-- IGNORE 1 ROWS;


