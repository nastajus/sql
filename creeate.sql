CREATE SCHEMA IF NOT EXISTS fiction;

DELIMITER $$

CREATE FUNCTION convert_excel_serial_number_to_date_time (
    serial_number_date INT
)
RETURNS DATETIME
DETERMINISTIC
BEGIN
    DECLARE calc DATE;
-- DATE_ADD('1900-01-01', INTERVAL (42973.74257*60*60*24) second) as date
    SET calc = DATE_ADD('1900-01-01', INTERVAL ((serial_number_date - 2) * 60*60*24) second);
    RETURN (calc);
END$$
DELIMITER ;

CREATE TABLE got (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    release_date DATE NOT NULL,
    season VARCHAR(16) NOT NULL,
    episode VARCHAR(16) NOT NULL,
    episode_title VARCHAR(32) NOT NULL,
    name_full VARCHAR(32) NOT NULL, -- not interested in keyword conflicts today
    sentence VARCHAR(2048) NOT NULL
);

-- LOAD DATA INFILE 'c:/tmp/discounts.csv'
LOAD DATA INFILE 'scripts/game_of_thrones/game-of-thrones-script-all-seasons/Game_of_Thrones_Script.csv'
    INTO TABLE got
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES -- ;
-- IGNORE 1 ROWS;
-- (@c1, c2, c3, c4, c5, c6);
-- (@c1);
-- (@release_date)
(@release_date, season, episode, episode_title, name_full, sentence)
SET release_date = convert_excel_serial_number_to_date_time(@release_date);
