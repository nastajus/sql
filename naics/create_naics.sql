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
    -- CHARACTER SET utf8mb4 -- insufficient to solve issue importing some row's special characters
    CHARACTER SET latin1 -- solves issue importing
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (@skipLevel, code, classTitle, typeLabel, description);
-- [HY000][1300] Invalid utf8 character string: '"pig farming (i.e., swine, farrows, piglets, hogs,'


DROP TABLE IF EXISTS ca_structure;
CREATE TABLE ca_structure
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Level,	HierarchicalStructure,	Code,	ClassTitle,	Superscript,	ClassDefinition

);

DROP TABLE IF EXISTS ca_element;
CREATE TABLE ca_element
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

);

DROP TABLE IF EXISTS ca_element;
CREATE TABLE ca_element
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

);