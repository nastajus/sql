CREATE SCHEMA IF NOT EXISTS naics;
USE naics;

-- naics-scian-2017-element-v3-eng.csv   -- ca_element   -- Level,	Code,	ClassTitle,	TypeLabel,	Description
-- naics-scian-2017-structure-v3-eng.csv -- ca_structure -- Level,	HierarchicalStructure,	Code,	ClassTitle,	Superscript,	ClassDefinition

-- 2-6 digit_2017_Codes.tsv        -- us_2_6_digit_codes -- SeqNo,	UsCode, 	UsTitle
-- 6-digit_2017_Codes.tsv          -- us_6_digit_codes   -- Code,	Title
-- 2017_NAICS_Cross_References.tsv -- us_cross_reference -- Code,	CrossReference (~long desc incl more codes)
-- 2017_NAICS_Descriptions.tsv     -- us_descriptions    -- Code,	Title,	Description
-- 2017_NAICS_Index_File.tsv       -- us_index_file      -- Code, Description (includes ****** at end)
-- 2017_NAICS_Structure.tsv        -- us_structure       -- Change, Code, Title


DROP TABLE IF EXISTS ca_element;
CREATE TABLE ca_element
(
    id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Level, -- useless, always says 5.
    code        VARCHAR(6),
    classTitle  VARCHAR(128),
    typeLabel   VARCHAR(32),
    description VARCHAR(512)
);

LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/canada/naics-scian-2017-element-v3-eng.csv' IGNORE
    INTO TABLE ca_element
    CHARACTER SET latin1
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (@skipLevel, code, classTitle, typeLabel, description);



DROP TABLE IF EXISTS ca_structure;
CREATE TABLE ca_structure
(
    id                    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Level                 VARCHAR(1),
    HierarchicalStructure VARCHAR(17),
    Code                  VARCHAR(6),
    ClassTitle            VARCHAR(128),
    Superscript           VARCHAR(3),
    ClassDefinition       VARCHAR(8192)
);

LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/canada/naics-scian-2017-structure-v3-eng.csv' IGNORE
    INTO TABLE ca_structure
    CHARACTER SET latin1 -- solves issue importing
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (Level, HierarchicalStructure, Code, ClassTitle, Superscript, ClassDefinition);



DROP TABLE IF EXISTS us_2_6_digit_codes;
CREATE TABLE us_2_6_digit_codes
(
    id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- SeqNo - skip
    code  VARCHAR(6),
    title VARCHAR(128)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/2-6 digit_2017_Codes.tsv' IGNORE
    INTO TABLE us_2_6_digit_codes
    -- CHARACTER SET latin1
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (@skipSeqNo, code, title);



DROP TABLE IF EXISTS us_6_digit_codes;
CREATE TABLE us_6_digit_codes
(
    id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code  VARCHAR(6),
    title VARCHAR(128)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/6-digit_2017_Codes.tsv' IGNORE
    INTO TABLE us_6_digit_codes
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (code, title);



DROP TABLE IF EXISTS us_cross_reference;
CREATE TABLE us_cross_reference
(
    id        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code      VARCHAR(6),
    reference VARCHAR(512)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/2017_NAICS_Cross_References.tsv' IGNORE
    INTO TABLE us_cross_reference
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (code, reference);



DROP TABLE IF EXISTS us_descriptions;
CREATE TABLE us_descriptions
(
    id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code        VARCHAR(6),
    title       VARCHAR(128),
    description VARCHAR(8192)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
-- this lost the superscript indicator, instead just appending "T" to the end of all titles. :/
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/2017_NAICS_Descriptions.tsv' IGNORE
    INTO TABLE us_descriptions
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (code, title, description);



DROP TABLE IF EXISTS us_index_file;
CREATE TABLE us_index_file
(
    id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code        VARCHAR(6),
    description VARCHAR(256) -- (includes ****** at end)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/2017_NAICS_Index_File.tsv' IGNORE
    INTO TABLE us_index_file
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (code, description);



DROP TABLE IF EXISTS us_structure;
CREATE TABLE us_structure
(
    id        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    indicator VARCHAR(2),
    code      VARCHAR(6),
    title     VARCHAR(128)
);

-- converted xlsx to tsv, as easiest to copy-paste (save-as wasn't working...)
-- this lost the superscript indicator, instead just appending "T" to the end of all titles. :/
LOAD DATA INFILE 'D:/[[TO QUERY]]/NAICS/us/2017_NAICS_Structure.tsv' IGNORE
    INTO TABLE us_structure
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (indicator, code, title);
