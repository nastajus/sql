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



-- yorgos lanthimos queries:
-- ======================== --
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




select nameId, primaryName, knownTitleId, titleType, primaryTitle, startYear, genres from (
select nconst as nameId, primaryName, primaryProfession, j.knownForTitles as knownTitleId from imdb.name_basics t
join json_table(
  concat('[', replace(json_quote(t.knownForTitles), ',', '","'), ']'),
  '$[*]' columns (knownForTitles varchar(64) path '$')
) j
where primaryName like 'yorgos lanthimos'
) s
join title_basics
where tconst = knownTitleId;



-- invisible man queries:
-- ====================== --
select * from imdb.title_basics t
where (primaryTitle like '%invisible man%' or originalTitle like '%invisible man%')
  and titleType like '%movie%'
and startYear = 2020;

select * from imdb.title_basics t where tconst = 'tt1051906';

-- attempt to extract *SOME* cast members... but not really what i want:...
select * from imdb.title_crew t where tconst = 'tt1051906';
select * from imdb.title_principals t where tconst = 'tt1051906';

select p.nconst, category, job, characters, n.* from imdb.title_principals p
join name_basics n
    on p.nconst = n.nconst
where tconst = 'tt1051906';

-- **  gets cast for a title. **
-- select primaryTitle, p.* from title_basics b
-- select primaryTitle, p.tconst, p.nconst, p.category, p.job, p.characters  title_basics b
-- select primaryTitle, p.tconst, p.nconst, p.category, p.job, p.characters, n.* from title_basics b
    select primaryTitle,
           p.tconst, p.nconst,
           n.primaryName,
           p.category, p.job, p.characters,
           n.birthYear, n.deathYear, n.primaryProfession,
           j.knownForTitles from title_basics b
join imdb.title_principals p
    on b.tconst = p.tconst
join imdb.name_basics n
    on n.nconst = p.nconst
join json_table(
  concat('[', replace(json_quote(n.knownForTitles), ',', '","'), ']'),
  '$[*]' columns (knownForTitles varchar(64) path '$')
) j
where b.tconst = 'tt1051906';
