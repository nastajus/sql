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

-- credits queries:
-- ================ --

-- **  gets cast for a title, and their other popular titles! **
    select b.primaryTitle,
           p.tconst, p.nconst,
           n.primaryName,
           p.category, p.job, p.characters,
           n.birthYear, n.deathYear, n.primaryProfession,
           j.knownForTitle,
           bb.primaryTitle as otherPrimaryTitle
    from title_basics b
join imdb.title_principals p
    on b.tconst = p.tconst
join imdb.name_basics n
    on n.nconst = p.nconst
join json_table(
  concat('[', replace(json_quote(n.knownForTitles), ',', '","'), ']'),
  '$[*]' columns (knownForTitle varchar(64) path '$')
) j
join title_basics bb
    on j.knownForTitle = bb.tconst
where b.tconst = 'tt1051906';


-- ** film's people's roles, plus... **
-- ** a film's principal roles of it's people & their birth, death, and profession **
-- principal roles include: (actors/etc, producer, composer, cinematographers, writer, directors)
     select b.primaryTitle,
            p.tconst, p.nconst,
            n.primaryName,
            p.category, p.job, p.characters,
            n.birthYear, n.deathYear, n.primaryProfession
    from title_basics b
join imdb.title_principals p
    on b.tconst = p.tconst
join imdb.name_basics n
    on n.nconst = p.nconst
where b.tconst = 'tt1051906';



-- https://stackoverflow.com/questions/5287246/mysql-join-and-exclude
-- really good example scenario... shows optimization value and gives simpler/slower one anyways...
-- ** a film's people's roles ... and their 'other' primary professions.
     select b.primaryTitle,
            p.tconst, p.nconst,
            n.primaryName,
            p.category, p.job, p.characters,
            group_concat(j.eachPrimaryProfession separator ',') as otherPrimaryProfessions,
            n.birthYear, n.deathYear
    from title_basics b
join imdb.title_principals p
    on b.tconst = p.tconst
join imdb.name_basics n
    on n.nconst = p.nconst
join json_table(
  concat('[', replace(json_quote(n.primaryProfession), ',', '","'), ']'),
  '$[*]' columns (eachPrimaryProfession varchar(64) path '$')
) j
where j.eachPrimaryProfession != p.category
  and b.tconst = 'tt1051906'
group by p.nconst;



--  find actor in specific genres only
select n.nconst, n.primaryName, b.primaryTitle, p.tconst, p.category, p.job, p.characters,
       j.genre
from imdb.name_basics n
join title_principals p
    on n.nconst = p.nconst
join title_basics b
    on p.tconst = b.tconst
join json_table(
  concat('[', replace(json_quote(b.genres), ',', '","'), ']'),
  '$[*]' columns (genre varchar(64) path '$')
) j
    -- where primaryName like 'rachel weisz'
    where n.nconst = 'nm0001838'
    and genre = 'Sci-Fi'
-- Chain Reaction, Black Widow

select s.*, tp2.tconst,
   count(tconst) as countTConsts
from (
select count(tb.primaryTitle) as countTitles,
       primaryName, nb.nconst -- ,
       -- tp2.tconst,
       -- tb2.primaryTitle
from title_basics tb
join title_principals tp on tp.tconst = tb.tconst
join name_basics nb on nb.nconst = tp.nconst
where tb.primaryTitle like '%critical role%'
group by primaryName
having countTitles > 2
-- order by count desc;
) s
join title_principals tp2 on tp2.nconst = s.nconst
group by tp2.tconst
having countTConsts > 2
order by countTConsts desc;

join title_basics tb2 on tb2.tconst = tp2.tconst
