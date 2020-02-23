-- https://www.mysqltutorial.org/import-csv-file-mysql-table/

-- https://stackoverflow.com/questions/1219711/mysql-create-schema-and-create-database-is-there-any-difference
-- https://www.tutorialspoint.com/difference-between-schema-and-database-in-mysql
-- CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
CREATE SCHEMA IF NOT EXISTS fiction;

-- how do i add comments to a table?
-- https://dev.mysql.com/doc/refman/8.0/en/create-table.html
-- okay technically the syntax is visible, but bleh.
-- create table sample comment on mysql
-- find an actual example
-- https://stackoverflow.com/questions/199905/mysql-and-comments
-- okay, good.

-- do i need unique primary key sql?
-- now, i already know it's a super-good best practice... but... i wanna review why
-- https://stackoverflow.com/questions/840162/should-each-and-every-table-have-a-primary-key
-- irrev. nvm.
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


