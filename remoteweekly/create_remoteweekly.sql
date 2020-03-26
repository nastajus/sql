CREATE SCHEMA IF NOT EXISTS jobs;
USE jobs;

DROP TABLE IF EXISTS remote_weekly;
CREATE TABLE remote_weekly
(
    #	Company	Position	Date posted	Location	Salary	Labels	Company url	Link
    #   66  	112	        11      	58	        49  	166	    165	        199
    #   128     128         -           64          64      256     256         256
    id         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- # -- skip
    company    VARCHAR(128),
    position   VARCHAR(128),
    datePosted DATE,
    location   VARCHAR(64),
    salary     VARCHAR(64),
    labels     VARCHAR(256),
    companyUrl VARCHAR(256),
    link       VARCHAR(256),
    dateLoaded DATE,
    dateDiff   INT  -- hack, better as a view... but whatever i just want this data easily.

);

LOAD DATA INFILE 'D:/[[TO QUERY]]/remoteweekly/1575 Remote Jobs From 100+ Companies Hiring Remotely in February 2020 - List of Jobs - cleaned 2.tsv' IGNORE
    INTO TABLE remote_weekly
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (@skipNum, company, position, @vDatePosted, location, salary, labels, companyUrl, link, dateLoaded)
SET datePosted = STR_TO_DATE(@vDatePosted,'%m/%d/%Y'),
    dateLoaded = CURRENT_DATE(),
    dateDiff = DATEDIFF(dateLoaded, datePosted);


