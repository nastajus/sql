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

CREATE TABLE got (
    Release Date,Season,Episode,Episode Title,Name,Sentence
)

