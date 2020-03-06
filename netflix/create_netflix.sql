SHOW VARIABLES LIKE 'secure_file_priv';


CREATE SCHEMA IF NOT EXISTS netflix;
USE netflix;


DROP TABLE IF EXISTS viewing_history;
CREATE TABLE viewing_history
(
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title   VARCHAR(128) NOT NULL,
    season  VARCHAR(32), -- I manually inserted after parsing data export.
    episode VARCHAR(64), -- I manually inserted after parsing data export.
    date    DATE NOT NULL

    -- UNIQUE KEY ix_title_crew (title, season, episode, date)
);

 LOAD DATA INFILE 'D:/[[TO QUERY]]/[[personal]]/NetflixViewingHistory-seasonal-split.csv' IGNORE

-- LOAD DATA INFILE 'D:/[[TO QUERY]]/[[personal]]/NetflixViewingHistory-non-seasonal-split.csv' IGNORE

    INTO TABLE viewing_history
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
(title, season, episode, @vdate)
SET date = STR_TO_DATE(@vdate,'%c/%e/%y');
