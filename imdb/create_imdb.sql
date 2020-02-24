-- SHOW VARIABLES LIKE 'secure_file_priv';


CREATE SCHEMA IF NOT EXISTS imdb;
USE imdb;

DROP TABLE IF EXISTS got;
CREATE TABLE got (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    release_date DATE NOT NULL,
    season VARCHAR(16) NOT NULL,
    episode VARCHAR(16) NOT NULL,
    episode_title VARCHAR(64) NOT NULL,
    name_full VARCHAR(32) NOT NULL,
    sentence VARCHAR(2048) NOT NULL
);

-- name.basics.tsv - nconst, primaryName, birthYear, deathYear, primaryProfession, knownForTitles
-- title.akas.tsv - titleId, ordering, title, region, language, types, attributes, isOriginalTitle
-- title.crew.tsv - tconst, directors, writers
-- title.episode.tsv - tconst, parentTconst, seasonNumber, episodeNumber
-- title.principals.tsv - tconst, ordering, nconst, category, job, characters
-- title.ratings.tsv - tconst, averageRating, numVotes

