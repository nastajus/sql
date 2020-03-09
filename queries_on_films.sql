-- first set
CREATE SCHEMA IF NOT EXISTS shows;
USE shows;

DROP VIEW vw_trakt_shows;
CREATE VIEW vw_trakt_shows AS
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watched_movies
    UNION
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watchlist_movies
    UNION
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watchlist_shows;



-- second set, find some useful stuff:

select nconst, primaryName, primaryProfession, knownForTitles from imdb.name_basics where primaryName like 'yorgos lanthimos';

use imdb;





-- how to query csv list with json_table ! (needs mysql 8.0.4 at least)

CREATE TABLE mytable (
  `id` INTEGER,
  `name` VARCHAR(50)
);

INSERT INTO mytable
  (`id`, `name`)
VALUES
  ('1', 'a,b,c'),
  ('2', 'b');

select t.id, j.name
from mytable t
join json_table(
  concat('[', replace(json_quote(t.name), ',', '","'), ']'),
  '$[*]' columns (`name` varchar(50) path '$')
) j;




-- works, actually... just needed to upgrade from mysql 5.x to 8.x. woot!
-- https://stackoverflow.com/questions/17942508/sql-split-values-to-multiple-rows
-- select t.nconst, t.primaryName, t.primaryProfession, j.knownForTitles from imdb.name_basics t
select nconst, primaryName, primaryProfession, j.knownForTitles from imdb.name_basics t
join json_table(
  concat('[', replace(json_quote(t.knownForTitles), ',', '","'), ']'),
  '$[*]' columns (knownForTitles varchar(64) path '$')
) j
where primaryName like 'yorgos lanthimos';

select * from json_table
(
    concat('[', replace (json_quote(imdb.name_basics.knownForTitles), ',', '","'), ']')
);
-- SELECT * FROM imdb.name_basics WHERE knownForTitles REGEXP '\b1\b'




select * from (
select nconst as nameId, primaryName, primaryProfession, j.knownForTitles as knownTitleId from imdb.name_basics t
join json_table(
  concat('[', replace(json_quote(t.knownForTitles), ',', '","'), ']'),
  '$[*]' columns (knownForTitles varchar(64) path '$')
) j
where primaryName like 'yorgos lanthimos'
) s
join title_basics
where tconst = knownTitleId