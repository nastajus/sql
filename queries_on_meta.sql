select version();

SELECT table_schema AS "Database",
       TRUNCATE(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)"
FROM information_schema.TABLES GROUP BY table_schema;

SELECT
     table_schema as `Database`,
     table_name AS `Table`,
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB`
FROM information_schema.TABLES
-- GROUP BY table_schema; -- WEIRD SIDE EFFECT... SHOWS FIRST TABLE...


-- name_basics	2536.98
-- title_akas	2407.98
-- title_basics	660.00
-- title_crew	358.84
-- title_principals	2359.00
-- title_ratings	44.58



-- challenge_secret_location	0.03
-- codecast_articles	0.01
-- dialogue	3.89
-- fresh	0.14
-- imdb	9264.37
-- information_schema	0.15
-- mysql	2.51
-- naics	11.07
-- nastajus_wvchallenge_db	0.09
-- netflix	0.21
-- performance_schema	0.00
-- phpmyadmin	0.39
-- sakila	6.45
-- sequelize_database	0.06
-- sequelize_db_cc	0.04
-- shows
-- sys	0.01
-- trakt	0.12
-- walkthroughcode_database	0.06
-- world	0.76
-- wvchallenge_database	0.01

-- total non-imdb 26 mb