CREATE SCHEMA IF NOT EXISTS trakt;
USE trakt;

DROP TABLE IF  EXISTS watchlist_shows;

CREATE TABLE IF NOT EXISTS watchlist_shows (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `some_id` INT,
    `listed_at` VARCHAR(24) CHARACTER SET utf8,
    `status` VARCHAR(16) CHARACTER SET utf8,
    `type` VARCHAR(16) CHARACTER SET utf8,
    `title` VARCHAR(38) CHARACTER SET utf8,
    `year` INT,
    `ids_trakt` INT,
    `ids_slug` VARCHAR(39) CHARACTER SET utf8,
    `ids_tvdb` INT, -- new not in movies
    `ids_imdb` VARCHAR(9) CHARACTER SET utf8,
    `ids_tmdb` INT,
    `ids_tvrage` INT -- new not in movies
);
INSERT INTO watchlist_shows (`some_id`, `listed_at`, `status`, `type`, `title`,
                             `year`, `ids_trakt`, `ids_slug`, `ids_tvdb`, `ids_imdb`, `ids_tmdb`, `ids_tvrage`) VALUES
    (429170587,'2019-07-17T05:01:56.000Z','watchlist','show','Big Hero 6: The Series',2017,115714,'big-hero-6-the-series',322241,'tt5515212',68665,NULL),
    (429170598,'2019-07-17T05:02:38.000Z','watchlist','show','Sailor Moon Crystal',2014,60834,'sailor-moon-crystal',275039,'tt3124992',61339,35885),
    (429170617,'2019-07-17T05:03:00.000Z','watchlist','show','Attack on Titan Abridged',2013,76642,'attack-on-titan-abridged',278084,NULL,NULL,NULL),
    (429170618,'2019-07-17T05:03:03.000Z','watchlist','show','Attack on Titan: Junior High',2015,101478,'attack-on-titan-junior-high',299882,'tt4906830',63510,NULL),
    (429170624,'2019-07-17T04:56:06.000Z','watchlist','show','Battlestar Galactica',1978,500,'battlestar-galactica',71173,'tt0076984',501,2729),
    (429170629,'2019-07-17T05:03:42.000Z','watchlist','show','Battlestar Galactica: Blood & Chrome',2012,33095,'battlestar-galactica-blood-chrome',204781,'tt1704292',33240,26832),
    (429170644,'2019-07-17T05:04:07.000Z','watchlist','show','Galactica 1980',1980,4597,'galactica-1980',71170,'tt0080221',4621,3637),
    (429170652,'2019-07-17T05:04:33.000Z','watchlist','show','Better Call Saul Employee Training',2017,149027,'better-call-saul-employee-training-2017',365403,'tt7435402',90746,NULL),
    (429171010,'2019-07-17T05:18:12.000Z','watchlist','show','iZombie',2015,77686,'izombie',281470,'tt3501584',60866,38804),
    (429171023,'2019-07-17T05:18:35.000Z','watchlist','show','King of the Hill',1997,2109,'king-of-the-hill',73903,'tt0118375',2122,4134),
    (429171029,'2019-07-17T05:18:46.000Z','watchlist','show','American Ninja Warrior',2009,37755,'american-ninja-warrior',212411,'tt1587934',37913,NULL),
    (429171602,'2019-07-17T05:22:34.000Z','watchlist','show','Slimer! And the Real Ghostbusters',1988,21770,'slimer-and-the-real-ghostbusters',73701,'tt0124257',21871,5223),
    (429172269,'2019-07-17T05:24:10.000Z','watchlist','show','Fargo',2014,60203,'fargo',269613,'tt2802850',60622,35276),
    (429172394,'2019-07-17T05:24:58.000Z','watchlist','show','The New Batman Adventures',1997,4601,'the-new-batman-adventures',77084,'tt0118266',4625,NULL),
    (429173248,'2019-07-17T05:31:20.000Z','watchlist','show','The OA',2016,113835,'the-oa',321060,'tt4635282',69061,NULL),
    (429173429,'2019-07-17T05:31:13.000Z','watchlist','show','Republic City Hustle',2013,107997,'republic-city-hustle',312285,NULL,NULL,NULL),
    (429173927,'2019-07-17T05:36:19.000Z','watchlist','show','Video Games Live',2010,77065,'video-games-live',261433,NULL,NULL,NULL),
    (429174128,'2019-07-17T05:31:03.000Z','watchlist','show','Jumanji',1996,2105,'jumanji',76272,'tt0115228',2118,NULL),
    (429174152,'2019-07-17T05:39:26.000Z','watchlist','show','RoboCop: Prime Directives',2001,12013,'robocop-prime-directives',70513,'tt0220008',12066,5026),
    (429174208,'2019-07-17T05:41:37.000Z','watchlist','show','Gotham Girls',2000,15120,'gotham-girls',79390,'tt0337763',15185,NULL),
    (429174272,'2019-07-17T05:44:58.000Z','watchlist','show','X-Men',2011,62401,'x-men',236061,'tt2070571',43146,NULL),
    (429182583,'2019-07-17T05:49:43.000Z','watchlist','show','Babylon 5',1994,3117,'babylon-5',70726,'tt0105946',3137,2693),
    (429182824,'2019-07-17T05:57:04.000Z','watchlist','show','Heavy Metal L-Gaim',1984,9381,'heavy-metal-l-gaim',103691,'tt0377207',9429,12228),
    (429182834,'2019-07-17T05:57:30.000Z','watchlist','show','Fate/Stay Night',2006,61708,'fate-stay-night',79151,'tt0774809',37858,8542),
    (429182841,'2019-07-17T05:56:26.000Z','watchlist','show','Fate/Stay Night: Unlimited Blade Works',2014,60893,'fate-stay-night-unlimited-blade-works',278626,'tt3621796',61415,NULL),
    (429182854,'2019-07-17T05:58:29.000Z','watchlist','show','Madlax',2004,11232,'madlax',75001,'tt0465339',11284,NULL),
    (429182904,'2019-07-17T05:59:28.000Z','watchlist','show','Strange Sex',2010,34978,'strange-sex',178371,'tt1705089',35128,26139),
    (429183763,'2019-07-17T06:12:58.000Z','watchlist','show','Doctor Who Confidential',2005,1051,'doctor-who-confidential',79298,'tt0453422',1056,NULL),
    (429183766,'2019-07-17T06:12:53.000Z','watchlist','show','Doctor Who',1963,120,'doctor-who',76107,'tt0056751',121,NULL),
    (429184761,'2019-07-17T06:21:11.000Z','watchlist','show','Where in the World Is Carmen Sandiego?',1991,960,'where-in-the-world-is-carmen-sandiego',72207,'tt0106172',965,NULL),
    (429185761,'2019-07-17T06:23:03.000Z','watchlist','show','Dexter',2006,1396,'dexter',79349,'tt0773262',1405,NULL),
    (429185841,'2019-07-17T06:23:57.000Z','watchlist','show','Video Girl Ai',1992,22331,'video-girl-ai',79777,'tt0105748',22432,NULL),
    (429186087,'2019-07-17T06:26:00.000Z','watchlist','show','Smallville',2001,4580,'smallville',72218,'tt0279600',4604,0),
    (429186108,'2019-07-17T06:24:45.000Z','watchlist','show','One-Punch Man',2015,97548,'one-punch-man',293088,'tt4508902',63926,NULL),
    (429186135,'2019-07-17T06:26:10.000Z','watchlist','show','Parasyte -the maxim-',2014,60936,'parasyte-the-maxim',279831,'tt3358020',61459,NULL),
    (429301009,'2019-07-17T14:36:08.000Z','watchlist','show','Fate/Zero',2011,74325,'fate-zero',275798,'tt2051178',45845,NULL),
    (429300982,'2019-07-17T14:27:50.000Z','watchlist','show','Hemlock Grove',2013,42072,'hemlock-grove',259948,'tt2309295',42295,33272),
    (429301045,'2019-07-17T14:37:31.000Z','watchlist','show','Justice League',2001,60948,'justice-league',76320,'tt0275137',1618,4093),
    (429301315,'2019-07-17T14:43:44.000Z','watchlist','show','Melody of Oblivion',2004,34653,'melody-of-oblivion',75000,NULL,34802,2233),
    (429309606,'2019-07-17T14:41:19.000Z','watchlist','show','Friends With Benefits',2011,9728,'friends-with-benefits',163571,'tt1604113',9777,NULL),
    (429309621,'2019-07-17T14:47:38.000Z','watchlist','show','Brickleberry',2012,43925,'brickleberry',259569,'tt2022713',44169,31996),
    (429310350,'2019-07-17T14:57:26.000Z','watchlist','show','Scream Queens',2015,96979,'scream-queens-2015',293302,'tt4145384',62046,45726),
    (429310352,'2019-07-17T14:57:32.000Z','watchlist','show','Scream Queens',2008,8210,'scream-queens',97441,'tt1248289',8256,NULL),
    (429310626,'2019-07-17T15:05:32.000Z','watchlist','show','Significant Others',2004,3789,'significant-others',73808,NULL,3812,NULL),
    (429310938,'2019-07-17T15:13:36.000Z','watchlist','show','Bionic Woman',2007,1240,'bionic-woman',80370,'tt0880557',1246,NULL),
    (429312315,'2019-07-17T15:27:11.000Z','watchlist','show','The Dick Tracy show',1961,15054,'the-dick-tracy-show',254049,'tt0281433',15119,NULL),
    (429324079,'2019-07-17T16:40:39.000Z','watchlist','show','CSI: Miami',2002,1609,'csi-miami',78310,'tt0313043',1620,3184),
    (429332842,'2019-07-17T16:50:29.000Z','watchlist','show','Mindhunter',2017,116965,'mindhunter',328708,'tt5290382',67744,NULL),
    (429335111,'2019-07-17T17:02:35.000Z','watchlist','show','Goblin Slayer',2018,134037,'goblin-slayer',350166,'tt8690728',82591,NULL),
    (429596722,'2019-07-18T13:32:56.000Z','watchlist','show','Band of Brothers',2001,4589,'band-of-brothers',74205,'tt0185906',4613,2708),
    (430037679,'2019-07-20T06:18:57.000Z','watchlist','show','DreamWorks Shorts',2001,65405,'dreamworks-shorts',144611,NULL,NULL,NULL),
    (430037731,'2019-07-20T06:21:16.000Z','watchlist','show','Upper Middle Bogan',2013,58097,'upper-middle-bogan',271585,'tt2401525',58479,37154),
    (430038021,'2019-07-20T06:29:28.000Z','watchlist','show','The Neverending Story',1995,10935,'the-neverending-story',77007,'tt0115406',10986,NULL);


UPDATE watchlist_shows
SET listed_at = DATE_FORMAT(STR_TO_DATE(listed_at,'%Y-%m-%dT%H:%i:%s.000Z'),'%Y-%m-%d %H:%i:%s');

ALTER TABLE watchlist_shows MODIFY COLUMN listed_at DATETIME;
