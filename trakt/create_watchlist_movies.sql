CREATE SCHEMA IF NOT EXISTS trakt;
USE trakt;

DROP TABLE IF  EXISTS watchlist_movies;

CREATE TABLE IF NOT EXISTS watchlist_movies (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `some_id` INT,
    `listed_at` VARCHAR(32) CHARACTER SET utf8,
    `status` VARCHAR(16) CHARACTER SET utf8,
    `type` VARCHAR(16) CHARACTER SET utf8,
    `title` VARCHAR(128) CHARACTER SET utf8,
    `year` INT,
    `ids_trakt` INT,
    `ids_slug` VARCHAR(64) CHARACTER SET utf8,
    `ids_imdb` VARCHAR(10) CHARACTER SET utf8,
    `ids_tmdb` INT
);
INSERT INTO watchlist_movies (`some_id`,`listed_at`,`status`,`type`,`title`,`year`,`ids_trakt`,`ids_slug`,`ids_imdb`,`ids_tmdb`) VALUES
    (429170600,'2019-07-17T05:01:18.000Z','watchlist','movie','Sailor Moon SuperS: The Movie: Black Dream Hole',1995,17749,'sailor-moon-supers-the-movie-black-dream-hole-1995','tt0112513',28460),
    (429170601,'2019-07-17T05:02:41.000Z','watchlist','movie','Sailor Moon - La Reconquista',2013,157236,'sailor-moon-la-reconquista-2013',NULL,257519),
    (429170609,'2019-07-17T05:02:58.000Z','watchlist','movie','Attack on Titan II: End of the World',2015,220829,'attack-on-titan-ii-end-of-the-world-2015','tt4294052',340382),
    (429170620,'2019-07-17T05:03:13.000Z','watchlist','movie','Doctor Who: The Twin Dilemma',1984,320198,'doctor-who-the-twin-dilemma-1984',NULL,437882),
    (429170628,'2019-07-17T05:03:25.000Z','watchlist','movie','Battlestar Galactica: Razor',2007,50626,'battlestar-galactica-razor-2007','tt0991178',69315),
    (429170632,'2019-07-17T05:03:28.000Z','watchlist','movie','Battlestar Galactica: The Plan',2009,74848,'battlestar-galactica-the-plan-2009','tt1286130',105077),
    (429170638,'2019-07-17T05:03:46.000Z','watchlist','movie','Battlestar Galactica',2003,157612,'battlestar-galactica-2003','tt0314979',325553),
    (429170642,'2019-07-17T05:04:06.000Z','watchlist','movie','Battlestar Galactica: The Lowdown',2003,285391,'battlestar-galactica-the-lowdown-2003','tt2222402',439369),
    (429171072,'2019-07-17T05:20:17.000Z','watchlist','movie','The Matrix Revisited',2001,8760,'the-matrix-revisited-2001','tt0295432',14543),
    (429171075,'2019-07-17T05:20:32.000Z','watchlist','movie','Making The Matrix',1999,205793,'making-the-matrix-1999','tt0365467',325251),
    (429171320,'2019-07-17T05:20:38.000Z','watchlist','movie','The Terminal',2004,472,'the-terminal-2004','tt0362227',594),
    (429172113,'2019-07-17T05:22:50.000Z','watchlist','movie','Gargoyles: The Heroes Awaken',1995,182951,'gargoyles-the-heroes-awaken-1995',NULL,285763),
    (429172256,'2019-07-17T05:22:36.000Z','watchlist','movie','Addams Family Values',1993,1842,'addams-family-values-1993','tt0106220',2758),
    (429172446,'2019-07-17T05:25:15.000Z','watchlist','movie','The Lego Movie 2: The Second Part',2019,177700,'the-lego-movie-2-the-second-part-2019','tt3513498',280217),
    (429172460,'2019-07-17T05:25:26.000Z','watchlist','movie','Toy Story 4',2019,193972,'toy-story-4-2019','tt1979376',301528),
    (429172513,'2019-07-17T05:25:41.000Z','watchlist','movie','Gremlins 3',NULL,270010,'gremlins-3','tt2918116',370322),
    (429172525,'2019-07-17T05:26:01.000Z','watchlist','movie','Disney Star Wars Episode VII: Return of the Empire',2013,116976,'disney-star-wars-episode-vii-return-of-the-empire-2013',NULL,186739),
    (429172549,'2019-07-17T05:26:13.000Z','watchlist','movie','Shrek 2',2004,652,'shrek-2-2004','tt0298148',809),
    (429172568,'2019-07-17T05:26:13.000Z','watchlist','movie','Shrek Forever After',2010,5406,'shrek-forever-after-2010','tt0892791',10192),
    (429172759,'2019-07-17T05:27:50.000Z','watchlist','movie','Grave of the Fireflies',1988,7251,'grave-of-the-fireflies-1988','tt0095327',12477),
    (429173335,'2019-07-17T05:32:11.000Z','watchlist','movie','Avatar Extended',2009,348113,'avatar-extended-2009',NULL,501100),
    (429173863,'2019-07-17T05:35:41.000Z','watchlist','movie','Sherlock Holmes',2009,5706,'sherlock-holmes-2009','tt0988045',10528),
    (429173870,'2019-07-17T05:35:44.000Z','watchlist','movie','Sherlock: The Abominable Bride',2016,224175,'sherlock-the-abominable-bride-2016','tt3845232',379170),
    (429173873,'2019-07-17T05:35:54.000Z','watchlist','movie','Sherlock Holmes: A Game of Shadows',2011,41908,'sherlock-holmes-a-game-of-shadows-2011','tt1515091',58574),
    (429173875,'2019-07-17T05:28:32.000Z','watchlist','movie','Sherlock Holmes',2010,21507,'sherlock-holmes-2010','tt1522835',33555),
    (429173959,'2019-07-17T05:36:46.000Z','watchlist','movie','The Happytime Murders',2018,258387,'the-happytime-murders-2018','tt1308728',412988),
    (429174049,'2019-07-17T05:37:23.000Z','watchlist','movie','Fullmetal Alchemist The Movie: Conqueror of Shamballa',2005,8364,'fullmetal-alchemist-the-movie-conqueror-of-shamballa-2005','tt0485323',14003),
    (429174107,'2019-07-17T05:38:03.000Z','watchlist','movie','Alien: Covenant',2017,86997,'alien-covenant-2017','tt2316204',126889),
    (429174108,'2019-07-17T05:38:05.000Z','watchlist','movie','Alien Resurrection',1997,4045,'alien-resurrection-1997','tt0118583',8078),
    (429174132,'2019-07-17T05:31:09.000Z','watchlist','movie','Zathura: A Space Adventure',2005,3749,'zathura-a-space-adventure-2005','tt0406375',6795),
    (429174149,'2019-07-17T05:39:21.000Z','watchlist','movie','RoboCop 3',1993,3140,'robocop-3-1993','tt0107978',5550),
    (429174150,'2019-07-17T05:39:28.000Z','watchlist','movie','Our RoboCop Remake',2014,154661,'our-robocop-remake-2014','tt3528906',254251),
    (429174153,'2019-07-17T05:39:28.000Z','watchlist','movie','RoboCop: Prime Directives',2001,54632,'robocop-prime-directives-2001','tt0220008',74236),
    (429174207,'2019-07-17T05:41:34.000Z','watchlist','movie','Batman: Gotham Knight',2008,8235,'batman-gotham-knight-2008','tt1117563',13851),
    (429174229,'2019-07-17T05:42:35.000Z','watchlist','movie','Confessions from a Holiday Camp',1977,34978,'confessions-from-a-holiday-camp-1977','tt0075875',50076),
    (429174233,'2019-07-17T05:35:19.000Z','watchlist','movie','Attack of the 50 Foot Woman',1958,11494,'attack-of-the-50-foot-woman-1958','tt0051380',18724),
    (429174234,'2019-07-17T05:42:40.000Z','watchlist','movie','Scream at the Devil',2015,230574,'scream-at-the-devil-2015','tt2622672',309013),
    (429174247,'2019-07-17T05:43:57.000Z','watchlist','movie','South Park: Imaginationland',2008,9807,'south-park-imaginationland-2008','tt1308667',16023),
    (429174248,'2019-07-17T05:44:01.000Z','watchlist','movie','Christmas Time in South Park',2000,97763,'christmas-time-in-south-park-2000','tt0263206',148039),
    (429174260,'2019-07-17T05:44:29.000Z','watchlist','movie','X-Men: The Last Stand',2006,23308,'x-men-the-last-stand-2006','tt0376994',36668),
    (429174266,'2019-07-17T05:44:45.000Z','watchlist','movie','X-Men: Reunited',2014,293671,'x-men-reunited-2014','tt5513986',447161),
    (429174267,'2019-07-17T05:37:30.000Z','watchlist','movie','X-Men: Unguarded',2015,293669,'x-men-unguarded-2015','tt5001882',447162),
    (429174268,'2019-07-17T05:43:28.000Z','watchlist','movie','X-Men: Apocalypse Unearthed',2016,293672,'x-men-apocalypse-unearthed-2016','tt6401620',447167),
    (429174274,'2019-07-17T05:45:16.000Z','watchlist','movie','X-Men: Apocalypse',2016,149999,'x-men-apocalypse-2016','tt3385516',246655),
    (429174276,'2019-07-17T05:43:51.000Z','watchlist','movie','X-Men Origins: Wolverine',2009,1430,'x-men-origins-wolverine-2009','tt0458525',2080),
    (429182572,'2019-07-17T05:49:02.000Z','watchlist','movie','He-Man and She-Ra: The Secret of the Sword',1985,11946,'he-man-and-she-ra-the-secret-of-the-sword-1985','tt0089984',19386),
    (429182592,'2019-07-17T05:49:44.000Z','watchlist','movie','Star Trek The Next Generation - All Good Things',1994,229127,'star-trek-the-next-generation-all-good-things-1994','tt0111281',384390),
    (429182594,'2019-07-17T05:49:51.000Z','watchlist','movie','Star Trek The Next Generation - The Best of Both Worlds',1990,178069,'star-trek-the-next-generation-the-best-of-both-worlds-1990','tt0268987',280624),
    (429182721,'2019-07-17T05:52:07.000Z','watchlist','movie','Child''s Play 2',1990,6312,'child-s-play-2-1990','tt0099253',11186),
    (429182723,'2019-07-17T05:52:08.000Z','watchlist','movie','Child''s Play 3',1991,6313,'child-s-play-3-1991','tt0103956',11187),
    (429182733,'2019-07-17T05:52:42.000Z','watchlist','movie','Pokémon: Mewtwo Returns',2000,23509,'pokemon-mewtwo-returns-2000','tt0304564',36897),
    (429182738,'2019-07-17T05:53:04.000Z','watchlist','movie','Pokémon Detective Pikachu',2019,294039,'pokemon-detective-pikachu-2019','tt5884052',447404),
    (429182739,'2019-07-17T05:53:07.000Z','watchlist','movie','Pokémon Apokélypse',2010,139369,'pokemon-apokelypse-2010','tt1831736',227993),
    (429182751,'2019-07-17T05:54:05.000Z','watchlist','movie','Aladdin and the Wonderful Lamp',1982,284271,'aladdin-and-the-wonderful-lamp-1982','tt0202239',310576),
    (429182794,'2019-07-17T05:55:08.000Z','watchlist','movie','Turtles Can Fly',2005,4133,'turtles-can-fly-2005','tt0424227',8340),
    (429182799,'2019-07-17T05:55:26.000Z','watchlist','movie','Teenage Mutant Ninja Turtles III',1993,993,'teenage-mutant-ninja-turtles-iii-1993','tt0108308',1499),
    (429182821,'2019-07-17T05:56:50.000Z','watchlist','movie','Heavy Metal 2000',2000,9969,'heavy-metal-2000-2000','tt0119273',16225),
    (429182829,'2019-07-17T05:49:46.000Z','watchlist','movie','The Maxx',1995,240734,'the-maxx-1995','tt0112065',397769),
    (429182835,'2019-07-17T05:57:48.000Z','watchlist','movie','Terrible Fate',2016,272122,'terrible-fate-2016','tt7317674',427888),
    (429182888,'2019-07-17T05:52:37.000Z','watchlist','movie','Scott Pilgrim vs. the Animation',2010,33909,'scott-pilgrim-vs-the-animation-2010','tt1707823',48832),
    (429182893,'2019-07-17T06:00:19.000Z','watchlist','movie','The Making of ''Scott Pilgrim vs. the World''',2010,443500,'the-making-of-scott-pilgrim-vs-the-world-2010','tt1870545',597717),
    (429182907,'2019-07-17T05:53:35.000Z','watchlist','movie','Man & Wife: An Educational Film for Married Adults',1969,184837,'man-wife-an-educational-film-for-married-adults-1969','tt0066055',287787),
    (429183053,'2019-07-17T06:02:41.000Z','watchlist','movie','The Jungle Book',2016,176503,'the-jungle-book-2016','tt3040964',278927),
    (429183133,'2019-07-17T06:08:10.000Z','watchlist','movie','The Alien Agenda: A Filmmaker''s Log',2009,137165,'the-alien-agenda-a-filmmaker-s-log-2009','tt1555213',223489),
    (429183605,'2019-07-17T06:11:19.000Z','watchlist','movie','Inspector Gadget',1999,279,'inspector-gadget-1999','tt0141369',332),
    (429183659,'2019-07-17T06:11:54.000Z','watchlist','movie','The Flintstones',1994,731,'the-flintstones-1994','tt0109813',888),
    (429183706,'2019-07-17T06:12:17.000Z','watchlist','movie','Ice Age: Dawn of the Dinosaurs',2009,4146,'ice-age-dawn-of-the-dinosaurs-2009','tt1080016',8355),
    (429183712,'2019-07-17T06:12:28.000Z','watchlist','movie','Dr. Who and the Daleks',1965,16189,'dr-who-and-the-daleks-1965','tt0059126',26581),
    (429183934,'2019-07-17T06:14:19.000Z','watchlist','movie','Ghost in the Shell Arise - Border 3: Ghost Tears',2014,146574,'ghost-in-the-shell-arise-border-3-ghost-tears-2014','tt3579524',240341),
    (429183940,'2019-07-17T06:07:06.000Z','watchlist','movie','Ghost in the Shell: The New watchlist',2015,215079,'ghost-in-the-shell-the-new-movie-2015','tt4337072',334376),
    (429184156,'2019-07-17T06:16:25.000Z','watchlist','movie','World War Z',2013,53002,'world-war-z-2013','tt0816711',72190),
    (429184237,'2019-07-17T06:16:56.000Z','watchlist','movie','Transformers: The Last Knight',2017,216718,'transformers-the-last-knight-2017','tt3371366',335988),
    (429184240,'2019-07-17T06:17:07.000Z','watchlist','movie','Transformers: Age of Extinction',2014,67751,'transformers-age-of-extinction-2014','tt2109248',91314),
    (429184259,'2019-07-17T06:17:23.000Z','watchlist','movie','The Transformers: The watchlist',1986,1236,'the-transformers-the-movie-1986','tt0092106',1857),
    (429184279,'2019-07-17T06:17:12.000Z','watchlist','movie','Transformers: Revenge of the Fallen',2009,4158,'transformers-revenge-of-the-fallen-2009','tt1055369',8373),
    (429184292,'2019-07-17T06:15:58.000Z','watchlist','movie','Transformers: Dark of the Moon',2011,24763,'transformers-dark-of-the-moon-2011','tt1399103',38356),
    (429184681,'2019-07-17T06:20:24.000Z','watchlist','movie','The Phantom of the Opera',2004,5088,'the-phantom-of-the-opera-2004','tt0293508',9833),
    (429184868,'2019-07-17T06:14:22.000Z','watchlist','movie','Singularity',2017,331788,'singularity-2017','tt7312940',484886),
    (429185768,'2019-07-17T06:23:09.000Z','watchlist','movie','I Want What I Want',1972,78061,'i-want-what-i-want-1972','tt0068726',110701),
    (429185779,'2019-07-17T06:23:22.000Z','watchlist','movie','True Lies',1994,23560,'true-lies-1994','tt0111503',36955),
    (429185783,'2019-07-17T06:23:32.000Z','watchlist','movie','Dreams Come True',1984,141536,'dreams-come-true-1984','tt0083853',232194),
    (429185801,'2019-07-17T06:23:27.000Z','watchlist','movie','Propaganda: The Art of Selling Lies',2019,443249,'propaganda-the-art-of-selling-lies-2019','tt8237924',589326),
    (429185832,'2019-07-17T06:23:42.000Z','watchlist','movie','Charlie and the Chocolate Factory',2005,87,'charlie-and-the-chocolate-factory-2005','tt0367594',118),
    (429185837,'2019-07-17T06:23:47.000Z','watchlist','movie','JFK',1991,663,'jfk-1991','tt0102138',820),
    (429185899,'2019-07-17T06:23:02.000Z','watchlist','movie','Doctor Who',1996,195566,'doctor-who-1996','tt0116118',15691),
    (429185902,'2019-07-17T06:24:26.000Z','watchlist','movie','Doctor Who: Resolution',2019,419590,'doctor-who-resolution-2019','tt8758636',567903),
    (429185905,'2019-07-17T06:24:29.000Z','watchlist','movie','Doctor Who: Blink',2007,283881,'doctor-who-blink-2007',NULL,437556),
    (429185909,'2019-07-17T06:24:32.000Z','watchlist','movie','Doctor Who: Logopolis',1981,296738,'doctor-who-logopolis-1981',NULL,438273),
    (429185954,'2019-07-17T06:24:38.000Z','watchlist','movie','Doctor Who: A Christmas Carol',2010,196335,'doctor-who-a-christmas-carol-2010','tt1672218',315620),
    (429186014,'2019-07-17T06:25:18.000Z','watchlist','movie','DuckTales: Destination Adventure!',2018,390046,'ducktales-destination-adventure-2018',NULL,538662),
    (429186076,'2019-07-17T06:25:56.000Z','watchlist','movie','The Boss Baby 2',2021,306320,'the-boss-baby-2-2021','tt6932874',459151),
    (429299464,'2019-07-17T14:18:03.000Z','watchlist','movie','David Versus Monsanto',2009,64915,'david-versus-monsanto-2009','tt1522241',86349),
    (429299465,'2019-07-17T14:18:20.000Z','watchlist','movie','Always Be My Maybe',2016,227366,'always-be-my-maybe-2016','tt5341036',384487),
    (429299469,'2019-07-17T14:18:07.000Z','watchlist','movie','Yoga Hosers',2016,187718,'yoga-hosers-2016','tt3838992',290825),
    (429299471,'2019-07-17T14:18:15.000Z','watchlist','movie','Glorious',2018,413031,'glorious-2018','tt9248740',562700),
    (429299507,'2019-07-17T14:19:17.000Z','watchlist','movie','Beyond Food',2017,339338,'beyond-food-2017','tt6151244',492446),
    (429300947,'2019-07-17T14:34:03.000Z','watchlist','movie','Death Note',2017,222668,'death-note-2017','tt1241317',351460),
    (429300970,'2019-07-17T14:34:39.000Z','watchlist','movie','Psycho-Pass: The watchlist',2015,194995,'psycho-pass-the-movie-2015','tt4219130',296917),
    (429301025,'2019-07-17T14:36:33.000Z','watchlist','movie','Hot Fuzz',2007,2724,'hot-fuzz-2007','tt0425112',4638),
    (429301031,'2019-07-17T14:36:46.000Z','watchlist','movie','Grayson',2004,114384,'grayson-2004','tt0430154',181911),
    (429301034,'2019-07-17T14:35:32.000Z','watchlist','movie','Injustice: Gods Among Us',2013,182323,'injustice-gods-among-us-2013',NULL,285116),
    (429301075,'2019-07-17T14:38:48.000Z','watchlist','movie','Hellboy Animated: Sword of Storms',2006,10277,'hellboy-animated-sword-of-storms-2006','tt0810895',16774),
    (429301077,'2019-07-17T14:38:37.000Z','watchlist','movie','Hellboy Animated: Blood and Iron',2007,7750,'hellboy-animated-blood-and-iron-2007','tt0817910',13204),
    (429301114,'2019-07-17T14:39:45.000Z','watchlist','movie','Asterix & Obelix Take on Caesar',1999,4842,'asterix-obelix-take-on-caesar-1999','tt0133385',9564),
    (429301128,'2019-07-17T14:39:58.000Z','watchlist','movie','Asterix: The Mansions of the Gods',2014,108671,'asterix-the-mansions-of-the-gods-2014','tt3759416',170522),
    (429301129,'2019-07-17T14:38:42.000Z','watchlist','movie','Asterix and Cleopatra',1968,5162,'asterix-and-cleopatra-1968','tt0062687',9929),
    (429301155,'2019-07-17T14:40:46.000Z','watchlist','movie','The Iron Man',2007,428927,'the-iron-man-2007','tt0772174',579122),
    (429301175,'2019-07-17T14:41:33.000Z','watchlist','movie','Iron Monkey',1993,7501,'iron-monkey-1993','tt0108148',12780),
    (429301224,'2019-07-17T14:42:41.000Z','watchlist','movie','Batman & Mr. Freeze: SubZero',1998,9645,'batman-mr-freeze-subzero-1998','tt0143127',15805),
    (429301226,'2019-07-17T14:35:23.000Z','watchlist','movie','Batman: Mask of the Phantasm',1993,9048,'batman-mask-of-the-phantasm-1993','tt0106364',14919),
    (429301230,'2019-07-17T14:42:58.000Z','watchlist','movie','Batman: The Animated Series - The Legend Begins',2002,345437,'batman-the-animated-series-the-legend-begins-2002',NULL,498471),
    (429301243,'2019-07-17T14:43:09.000Z','watchlist','movie','Breakdown Lane',2017,244302,'breakdown-lane-2017','tt3121200',401359),
    (429301288,'2019-07-17T14:44:16.000Z','watchlist','movie','The Dyatlov Pass Incident',2013,108023,'the-dyatlov-pass-incident-2013','tt1905040',169219),
    (429301293,'2019-07-17T14:44:23.000Z','watchlist','movie','It Follows',2015,168349,'it-follows-2015','tt3235888',270303),
    (429301317,'2019-07-17T14:37:53.000Z','watchlist','movie','Land of Oblivion',2011,71680,'land-of-oblivion-2011','tt1555084',99389),
    (429301323,'2019-07-17T14:44:01.000Z','watchlist','movie','Wu: The Story of the Wu-Tang Clan',2008,70243,'wu-the-story-of-the-wu-tang-clan-2008','tt0950779',96340),
    (429301324,'2019-07-17T14:45:22.000Z','watchlist','movie','Staten Island Summer',2015,221695,'staten-island-summer-2015','tt3137764',343934),
    (429308683,'2019-07-17T14:46:11.000Z','watchlist','movie','Spider-Man 2',2004,439,'spider-man-2-2004','tt0316654',558),
    (429308685,'2019-07-17T14:38:54.000Z','watchlist','movie','Spider-Man 3',2007,440,'spider-man-3-2007','tt0413300',559),
    (429308692,'2019-07-17T14:46:21.000Z','watchlist','movie','The Amazing Spider-Man',2012,1302,'the-amazing-spider-man-2012','tt0948470',1930),
    (429308698,'2019-07-17T14:46:40.000Z','watchlist','movie','Pumping Iron II: The Women',1985,105876,'pumping-iron-ii-the-women-1985','tt0089852',164753),
    (429308709,'2019-07-17T14:47:01.000Z','watchlist','movie','House, M.D., Season Four: New Beginnings',2008,399999,'house-m-d-season-four-new-beginnings-2008','tt1329164',550295),
    (429309586,'2019-07-17T14:47:49.000Z','watchlist','movie','A Teacher',2013,102934,'a-teacher-2013','tt2201548',158884),
    (429309603,'2019-07-17T14:48:25.000Z','watchlist','movie','What If',2013,131538,'what-if-2013','tt1486834',212716),
    (429309613,'2019-07-17T14:48:41.000Z','watchlist','movie','Enemies with Benefits',2016,247530,'enemies-with-benefits-2016','tt5376052',403163),
    (429309615,'2019-07-17T14:48:43.000Z','watchlist','movie','No Strings Attached',2011,27584,'no-strings-attached-2011','tt1411238',41630),
    (429309639,'2019-07-17T14:49:34.000Z','watchlist','movie','Special Correspondents',2016,231675,'special-correspondents-2016','tt4181052',355008),
    (429309653,'2019-07-17T14:49:49.000Z','watchlist','movie','Ajin: Demi-Human',2017,280330,'ajin-demi-human-2017','tt6215712',433128),
    (429309829,'2019-07-17T14:52:05.000Z','watchlist','movie','The Forger',2014,155346,'the-forger-2014','tt2376218',255157),
    (429309893,'2019-07-17T14:54:19.000Z','watchlist','movie','Kung Fu Panda 3',2016,93870,'kung-fu-panda-3-2016','tt2267968',140300),
    (429309898,'2019-07-17T14:54:34.000Z','watchlist','movie','Kung Fu Panda: Secrets of the Furious Five',2008,9687,'kung-fu-panda-secrets-of-the-furious-five-2008','tt1287845',15854),
    (429309984,'2019-07-17T14:55:02.000Z','watchlist','movie','Flubber',1997,4852,'flubber-1997','tt0119137',9574),
    (429310028,'2019-07-17T14:56:13.000Z','watchlist','movie','The Making of ''The Nightmare Before Christmas''',1993,138246,'the-making-of-the-nightmare-before-christmas-1993','tt1028555',225804),
    (429310336,'2019-07-17T14:49:34.000Z','watchlist','movie','Underworld: Blood Wars',2016,222674,'underworld-blood-wars-2016','tt3717252',346672),
    (429310338,'2019-07-17T14:56:55.000Z','watchlist','movie','Antiporno',2016,259707,'antiporno-2016','tt5973032',414770),
    (429310356,'2019-07-17T14:57:42.000Z','watchlist','movie','Hardcore Henry',2015,221309,'hardcore-henry-2015','tt3072482',325348),
    (429310361,'2019-07-17T14:57:45.000Z','watchlist','movie','Hitman',2007,1067,'hitman-2007','tt0465494',1620),
    (429310365,'2019-07-17T14:57:59.000Z','watchlist','movie','ParaNorman',2012,57060,'paranorman-2012','tt1623288',77174),
    (429310410,'2019-07-17T14:59:36.000Z','watchlist','movie','The Blue Room',2014,164615,'the-blue-room-2014','tt3230082',266034),
    (429310412,'2019-07-17T14:52:23.000Z','watchlist','movie','The Blue Room',2002,100629,'the-blue-room-2002','tt0299956',154200),
    (429310426,'2019-07-17T15:00:05.000Z','watchlist','movie','The Treacherous',2015,219285,'the-treacherous-2015','tt4844288',338803),
    (429310429,'2019-07-17T15:00:07.000Z','watchlist','movie','No Reservations',2007,2313,'no-reservations-2007','tt0481141',3638),
    (429310444,'2019-07-17T15:00:32.000Z','watchlist','movie','Trainspotting',1996,503,'trainspotting-1996','tt0117951',627),
    (429310469,'2019-07-17T14:53:44.000Z','watchlist','movie','Jupiter Ascending',2015,56709,'jupiter-ascending-2015','tt1617661',76757),
    (429310542,'2019-07-17T15:03:04.000Z','watchlist','movie','Climate of Change',2010,62445,'climate-of-change-2010','tt1563712',83401),
    (429310549,'2019-07-17T14:55:58.000Z','watchlist','movie','Fed Up',2014,152050,'fed-up-2014','tt2381335',250657),
    (429310554,'2019-07-17T15:03:23.000Z','watchlist','movie','Fat, Sick & Nearly Dead',2010,53590,'fat-sick-nearly-dead-2010','tt1227378',72914),
    (429310592,'2019-07-17T15:02:41.000Z','watchlist','movie','Doctor Strange in the Multiverse of Madness',2021,299910,'doctor-strange-in-the-multiverse-of-madness-2021','tt9419884',453395),
    (429310640,'2019-07-17T15:05:56.000Z','watchlist','movie','Looper',2012,42897,'looper-2012','tt1276104',59967),
    (429310642,'2019-07-17T15:04:38.000Z','watchlist','movie','Terminator 3: Rise of the Machines',2003,249,'terminator-3-rise-of-the-machines-2003','tt0181852',296),
    (429310653,'2019-07-17T15:04:56.000Z','watchlist','movie','Cowspiracy: The Sustainability Secret',2014,179641,'cowspiracy-the-sustainability-secret-2014','tt3302820',282297),
    (429310717,'2019-07-17T15:08:02.000Z','watchlist','movie','Betting on Zero',2017,227164,'betting-on-zero-2017','tt3762912',385805),
    (429310732,'2019-07-17T15:08:24.000Z','watchlist','movie','Vegucated',2011,56191,'vegucated-2011','tt1814930',76127),
    (429310759,'2019-07-17T15:08:51.000Z','watchlist','movie','High Score',2006,37174,'high-score-2006','tt0808299',52732),
    (429310811,'2019-07-17T15:10:12.000Z','watchlist','movie','Sicario',2015,171369,'sicario-2015','tt3397884',273481),
    (429310845,'2019-07-17T15:11:01.000Z','watchlist','movie','Moana',2009,31378,'moana-2009','tt1465102',45890),
    (429310898,'2019-07-17T15:05:23.000Z','watchlist','movie','Black Panther',2018,181313,'black-panther-2018','tt1825683',284054),
    (429312321,'2019-07-17T15:27:13.000Z','watchlist','movie','Adventure Time',2007,261292,'adventure-time-2007','tt0784727',355460),
    (429322529,'2019-07-17T16:20:49.000Z','watchlist','movie','Basic Instinct',1992,320,'basic-instinct-1992','tt0103772',402),
    (429322530,'2019-07-17T16:20:54.000Z','watchlist','movie','Basic Instinct 2',2006,2068,'basic-instinct-2-2006','tt0430912',3093),
    (429322531,'2019-07-17T16:20:55.000Z','watchlist','movie','Fatal Instinct',1993,15848,'fatal-instinct-1993','tt0106873',26141),
    (429324158,'2019-07-17T16:43:20.000Z','watchlist','movie','Kill Bill: Vol. 2',2004,313,'kill-bill-vol-2-2004','tt0378194',393),
    (429324161,'2019-07-17T16:43:35.000Z','watchlist','movie','The Making of ''Kill Bill: Vol. 1''',2003,183559,'the-making-of-kill-bill-vol-1-2003','tt0412956',286416),
    (429324164,'2019-07-17T16:43:24.000Z','watchlist','movie','Kill Bill: The Origin of O-Ren',2003,174791,'kill-bill-the-origin-of-o-ren-2003',NULL,277103),
    (429324169,'2019-07-17T16:42:09.000Z','watchlist','movie','To Kill a Mockingbird',1962,473,'to-kill-a-mockingbird-1962','tt0056592',595),
    (429324520,'2019-07-17T16:45:15.000Z','watchlist','movie','Ghibli and The Miyazaki Mystery',2005,26654,'ghibli-and-the-miyazaki-mystery-2005','tt0436358',40544),
    (429332771,'2019-07-17T16:40:18.000Z','watchlist','movie','Captain Marvel',2019,193963,'captain-marvel-2019','tt4154664',299537),
    (429332772,'2019-07-17T16:46:18.000Z','watchlist','movie','Thor',2011,5408,'thor-2011','tt0800369',10195),
    (429333993,'2019-07-17T16:53:55.000Z','watchlist','movie','Cowboy Bebop: The watchlist',2001,6398,'cowboy-bebop-the-movie-2001','tt0275277',11299),
    (429334105,'2019-07-17T16:55:44.000Z','watchlist','movie','Trigun: Badlands Rumble',2010,36433,'trigun-badlands-rumble-2010','tt1703049',51859),
    (429334144,'2019-07-17T16:57:09.000Z','watchlist','movie','Panty & Stocking with Garterbelt',2010,319922,'panty-stocking-with-garterbelt-2010',NULL,472460),
    (429334154,'2019-07-17T16:57:40.000Z','watchlist','movie','Mahoromatic: Automatic Maiden',2004,173755,'mahoromatic-automatic-maiden-2004','tt0337769',275988),
    (429334168,'2019-07-17T16:58:02.000Z','watchlist','movie','Black Lagoon: Roberta''s Blood Trail',2010,228918,'black-lagoon-roberta-s-blood-trail-2010','tt1992386',387090),
    (429362746,'2019-07-17T18:58:06.000Z','watchlist','movie','Incredibles 2',2018,159626,'incredibles-2-2018','tt3606756',260513),
    (429596643,'2019-07-18T13:30:38.000Z','watchlist','movie','The Da Vinci Code',2006,469,'the-da-vinci-code-2006','tt0382625',591),
    (429596680,'2019-07-18T13:31:38.000Z','watchlist','movie','The Universal Story',1996,318507,'the-universal-story-1996','tt0114793',471198),
    (429596654,'2019-07-18T13:31:03.000Z','watchlist','movie','The Story Behind ''Toy Story''',2000,311924,'the-story-behind-toy-story-2000','tt0220070',464729),
    (429596688,'2019-07-18T13:24:27.000Z','watchlist','movie','The Celluloid Closet',1996,20899,'the-celluloid-closet-1996','tt0112651',32562),
    (429596717,'2019-07-18T13:32:45.000Z','watchlist','movie','Where the Wild Things Are',2009,10170,'where-the-wild-things-are-2009','tt0386117',16523),
    (429596816,'2019-07-18T13:26:49.000Z','watchlist','movie','You''ve Got Mail',1998,4773,'you-ve-got-mail-1998','tt0128853',9489),
    (429596824,'2019-07-18T13:34:18.000Z','watchlist','movie','Forrest Gump',1994,9,'forrest-gump-1994','tt0109830',13),
    (429596994,'2019-07-18T13:36:24.000Z','watchlist','movie','Tom and Jerry: Willy Wonka and the Chocolate Factory',2017,301739,'tom-and-jerry-willy-wonka-and-the-chocolate-factory-2017','tt6803390',455411),
    (429597001,'2019-07-18T13:36:46.000Z','watchlist','movie','The Meme Machine',2016,301260,'the-meme-machine-2016',NULL,430440),
    (429911916,'2019-07-19T16:04:01.000Z','watchlist','movie','Fantastic Beasts: The Crimes of Grindelwald',2018,219417,'fantastic-beasts-the-crimes-of-grindelwald-2018','tt4123430',338952),
    (429911928,'2019-07-19T16:04:11.000Z','watchlist','movie','Fantastic Beasts and Where to Find Them',2016,158661,'fantastic-beasts-and-where-to-find-them-2016','tt3183660',259316),
    (430037672,'2019-07-20T06:18:40.000Z','watchlist','movie','Megamind: The Button of Doom',2011,41232,'megamind-the-button-of-doom-2011','tt1847645',57718),
    (430037689,'2019-07-20T06:19:19.000Z','watchlist','movie','How to Train Your Dragon',2010,5405,'how-to-train-your-dragon-2010','tt0892769',10191),
    (430037692,'2019-07-20T06:18:03.000Z','watchlist','movie','How to Train Your Dragon 2',2014,61873,'how-to-train-your-dragon-2-2014','tt1646971',82702),
    (430037710,'2019-07-20T06:20:19.000Z','watchlist','movie','Bleach the Movie: Hell Verse',2010,53833,'bleach-the-movie-hell-verse-2010','tt1785394',73245),
    (430037734,'2019-07-20T06:21:15.000Z','watchlist','movie','Middle Men',2009,25159,'middle-men-2009','tt1251757',38842),
    (430037744,'2019-07-20T06:22:02.000Z','watchlist','movie','The Empire Strikes Back',1980,1266,'the-empire-strikes-back-1980','tt0080684',1891),
    (430037748,'2019-07-20T06:22:28.000Z','watchlist','movie','No Country for Old Men',2007,3798,'no-country-for-old-men-2007','tt0477348',6977),
    (430037781,'2019-07-20T06:23:28.000Z','watchlist','movie','GoodFellas',1990,612,'goodfellas-1990','tt0099685',769),
    (430037784,'2019-07-20T06:23:31.000Z','watchlist','movie','Raiders of the Lost Ark',1981,54,'raiders-of-the-lost-ark-1981','tt0082971',85),
    (430037792,'2019-07-20T06:23:38.000Z','watchlist','movie','Fight Club',1999,432,'fight-club-1999','tt0137523',550),
    (430037794,'2019-07-20T06:22:19.000Z','watchlist','movie','Star Wars',1977,7,'star-wars-1977','tt0076759',11),
    (430037800,'2019-07-20T06:23:51.000Z','watchlist','movie','The Grand Budapest Hotel',2014,83614,'the-grand-budapest-hotel-2014','tt2278388',120467),
    (430037804,'2019-07-20T06:24:10.000Z','watchlist','movie','Ex Machina',2015,163375,'ex-machina-2015','tt0470752',264660),
    (430037806,'2019-07-20T06:23:58.000Z','watchlist','movie','The Silence of the Lambs',1991,230,'the-silence-of-the-lambs-1991','tt0102926',274),
    (430037812,'2019-07-20T06:24:03.000Z','watchlist','movie','The Truman Show',1998,23734,'the-truman-show-1998','tt0120382',37165),
    (430037817,'2019-07-20T06:24:12.000Z','watchlist','movie','Spirited Away',2001,97,'spirited-away-2001','tt0245429',129),
    (430037826,'2019-07-20T06:24:23.000Z','watchlist','movie','Pan''s Labyrinth',2006,947,'pan-s-labyrinth-2006','tt0457430',1417),
    (430037850,'2019-07-20T06:24:56.000Z','watchlist','movie','The Thing',1982,843,'the-thing-1982','tt0084787',1091),
    (430037862,'2019-07-20T06:25:14.000Z','watchlist','movie','Groundhog Day',1993,103,'groundhog-day-1993','tt0107048',137),
    (430037875,'2019-07-20T06:18:14.000Z','watchlist','movie','American Beauty',1999,10,'american-beauty-1999','tt0169547',14),
    (430037882,'2019-07-20T06:26:09.000Z','watchlist','movie','Indiana Jones and the Last Crusade',1989,58,'indiana-jones-and-the-last-crusade-1989','tt0097576',89),
    (430037893,'2019-07-20T06:26:24.000Z','watchlist','movie','John Wick',2014,149640,'john-wick-2014','tt2911666',245891),
    (430037905,'2019-07-20T06:26:54.000Z','watchlist','movie','Eyes Wide Shut',1999,292,'eyes-wide-shut-1999','tt0120663',345),
    (430037909,'2019-07-20T06:27:01.000Z','watchlist','movie','Office Space',1999,1002,'office-space-1999','tt0151804',1542),
    (430037912,'2019-07-20T06:27:01.000Z','watchlist','movie','The Iron Giant',1999,5580,'the-iron-giant-1999','tt0129167',10386),
    (430037917,'2019-07-20T06:26:59.000Z','watchlist','movie','My Neighbor Totoro',1988,4169,'my-neighbor-totoro-1988','tt0096283',8392),
    (430037927,'2019-07-20T06:27:24.000Z','watchlist','movie','The Breakfast Club',1985,1457,'the-breakfast-club-1985','tt0088847',2108),
    (430037955,'2019-07-20T06:28:24.000Z','watchlist','movie','The Girl Next Door',2007,9316,'the-girl-next-door-2007','tt0830558',15356),
    (430037979,'2019-07-20T06:29:12.000Z','watchlist','movie','The Scarlet Letter',1995,5711,'the-scarlet-letter-1995','tt0114345',10533),
    (430037989,'2019-07-20T06:29:30.000Z','watchlist','movie','Harry Potter and the Prisoner of Azkaban',2004,547,'harry-potter-and-the-prisoner-of-azkaban-2004','tt0304141',673),
    (430038001,'2019-07-20T06:30:03.000Z','watchlist','movie','28 Days Later',2002,135,'28-days-later-2002','tt0289043',170),
    (430038010,'2019-07-20T06:22:52.000Z','watchlist','movie','This Is Spinal Tap',1984,6168,'this-is-spinal-tap-1984','tt0088258',11031),
    (430038020,'2019-07-20T06:30:47.000Z','watchlist','movie','The NeverEnding Story III',1994,17175,'the-neverending-story-iii-1994','tt0110647',27793),
    (430038022,'2019-07-20T06:31:02.000Z','watchlist','movie','The NeverEnding Story II: The Next Chapter',1990,22105,'the-neverending-story-ii-the-next-chapter-1990','tt0100240',34636),
    (430038035,'2019-07-20T06:30:17.000Z','watchlist','movie','Riddick',2013,65712,'riddick-2013','tt1411250',87421),
    (430038036,'2019-07-20T06:31:41.000Z','watchlist','movie','The Chronicles of Riddick',2004,1865,'the-chronicles-of-riddick-2004','tt0296572',2789),
    (430038226,'2019-07-20T06:33:38.000Z','watchlist','movie','John Wick: Chapter 3 - Parabellum',2019,304278,'john-wick-chapter-3-parabellum-2019','tt6146586',458156),
    (430038227,'2019-07-20T06:33:45.000Z','watchlist','movie','Apollo 11',2019,399358,'apollo-11-2019','tt8760684',549559),
    (430038244,'2019-07-20T06:34:25.000Z','watchlist','movie','I Am Mother',2019,353379,'i-am-mother-2019','tt6292852',505948),
    (430038247,'2019-07-20T06:27:08.000Z','watchlist','movie','Spider-Man: Far from Home',2019,273537,'spider-man-far-from-home-2019','tt6320628',429617),
    (430038254,'2019-07-20T06:34:58.000Z','watchlist','movie','Fast Color',2019,325212,'fast-color-2019','tt6418778',450487),
    (430038258,'2019-07-20T06:33:43.000Z','watchlist','movie','Brexit: The Uncivil War',2019,420043,'brexit-the-uncivil-war-2019','tt8425058',536176),
    (430038264,'2019-07-20T06:35:32.000Z','watchlist','movie','The Shawshank Redemption',1994,234,'the-shawshank-redemption-1994','tt0111161',278),
    (430038265,'2019-07-20T06:35:30.000Z','watchlist','movie','The Godfather: Part II',1974,198,'the-godfather-part-ii-1974','tt0071562',240),
    (430038266,'2019-07-20T06:35:31.000Z','watchlist','movie','Schindler''s List',1993,336,'schindler-s-list-1993','tt0108052',424),
    (430038278,'2019-07-20T06:36:05.000Z','watchlist','movie','Se7en',1995,650,'se7en-1995','tt0114369',807);

UPDATE watchlist_movies
SET listed_at = DATE_FORMAT(STR_TO_DATE(listed_at,'%Y-%m-%dT%H:%i:%s.000Z'),'%Y-%m-%d %H:%i:%s');

ALTER TABLE watchlist_movies MODIFY COLUMN listed_at DATETIME;