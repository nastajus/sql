CREATE SCHEMA IF NOT EXISTS shows;
USE shows;

DROP VIEW vw_trakt_shows;
CREATE VIEW vw_trakt_shows AS
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watched_movies
    UNION
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watchlist_movies
    UNION
    SELECT title, ids_imdb as imdb, status, type FROM trakt.watchlist_shows;


SELECT title, count(title) as frequency FROM netflix.viewing_history
GROUP BY title HAVING frequency > 1;

CREATE INDEX title_ix ON imdb.title_akas (title);
CREATE INDEX titleId_ix ON imdb.title_akas (titleId);

SELECT n.title, count(n.title), i.titleId as frequency FROM netflix.viewing_history n
INNER JOIN imdb.title_akas i ON i.title = n.title;

SELECT n.title, count(n.title), vt.imdb as frequency FROM netflix.viewing_history n
INNER JOIN shows.vw_trakt_shows vt on vt.title = n.title;


SELECT DISTINCT  n.title, vt.imdb FROM netflix.viewing_history n
INNER JOIN shows.vw_trakt_shows vt on vt.title = n.title;

-- SELECT DISTINCT  vt.title, i.titleId FROM shows.vw_trakt_shows vt
-- INNER JOIN imdb.title_akas i on i.titleId = vt.imdb;


SELECT * FROM (
SELECT DISTINCT n.title, ta.titleId as imdb FROM netflix.viewing_history n
left JOIN imdb.title_akas ta on ta.title = n.title
where ta.region = 'US'
order by n.title asc, ta.titleId asc
) AS TT;


select *
from imdb.title_akas WHERE titleId in (
    'tt11020844',
    'tt11546586',
    'tt1707372',
    'tt2515240',
    'tt2971090',
    'tt3480556',
    'tt3801160',
    'tt3839150',
    'tt4705422',
    'tt5863936',
    'tt6545032'
)
and region = 'US'
; -- 30



select productID, stuff((
    select ', ' + packageID
    from your_table_name
    where (productID = t.productID)
    for xml path(''), type).value('(./text())[1]','varchar(max)')
    , 1, 2, '') as single_value
from your_table_name  t
group by productID;


select * from (
SELECT DISTINCT  n.title, ta.titleId as imdb FROM netflix.viewing_history n
left JOIN imdb.title_akas ta on ta.title = n.title
where ta.region = 'US') as tt
left join imdb.name_basics nb on nb.knownForTitles