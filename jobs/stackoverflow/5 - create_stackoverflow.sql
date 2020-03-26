CREATE SCHEMA IF NOT EXISTS jobs;
USE jobs;

# Error:    [42000][1118] Row size too large. The maximum row size for the used table type, not counting BLOBs, is 65535. This includes storage overhead, check the manual. You have to change some columns to TEXT or BLOBs
# Googling: 65535 bytes is the max row size for mysql  With utf8mb4 charset, varchar(255) means this column at most uses 255 * 4 + 1 bytes. So it depends on what charset table use.

DROP TABLE IF EXISTS stackoverflow;
CREATE TABLE stackoverflow
(
    id                 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    # isPermaLink        VARCHAR(5),
    guid               VARCHAR(6),
    link               VARCHAR(256),
    author_name        VARCHAR(128),
    # category_0         VARCHAR(32),
    # category_1         VARCHAR(32),
    # category_2         VARCHAR(32),
    # category_3         VARCHAR(32),
    # category_4         VARCHAR(32),
    categories         VARCHAR(256), # 128 *just* works in my sample download.
    title              VARCHAR(256),
    description        VARCHAR(12222), # nope: 16384.  nope: 16383.  just do ~minimum
    pubDate            DATETIME,
    updatedDate        DATETIME,
    posting_origin_url VARCHAR(32),
    location           VARCHAR(64)
    # category_5         VARCHAR(32)
);

# guid/_isPermaLink	guid/__text	link	author/name/__text	category/0	category/1	category/2	category/3	category/4	title	description	pubDate	updated/__text	location/_xmlns	location/__text	category/5
# 17	11	170	81	23	24	22	25	24	162	11439	27	20	30	33	10

# isPermaLink	guid	link	author_name	category_0	category_1	category_2	category_3	category_4	title	description	pubDate	updatedDate	posting_origin_url	location	category_5
# 5             6	    256	    128	        32	        32	        32	        32	        32	        256     16384	    --	    --  	    32      	        64  	    32
# 5             6	    170	    81	        23	        24	        22	        25	        24	        162     16384	    27	    20  	    30      	        33  	    10



LOAD DATA INFILE 'D:/[[TO QUERY]]/stackoverflow/Feed/convertcsv.tsv' IGNORE
    INTO TABLE stackoverflow
    FIELDS TERMINATED BY '\t'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (@skipIsPermaLink, guid, link, author_name, @category_0, @category_1, @category_2, @category_3, @category_4, title, description, @pubDate, @updatedDate, posting_origin_url, location, @category_5)
SET categories = CONCAT_WS('; ', @category_0, @category_1, @category_2, @category_3, @category_4, @category_5),
    pubDate = STR_TO_DATE(@pubDate,'%a, %d %b %Y %T Z'),
    updatedDate = STR_TO_DATE(@updatedDate,'%Y-%m-%dT%TZ')

    # Sat, 21 Mar 2020 17:02:44 Z -- Z normally indicates "zulu" time, aka, UTC/GMT
    # %a_, %d %b_ %Y__ %T______ Z

    # 2020-02-28T14:36:36Z
    # %Y__-%m-%dTT%______Z