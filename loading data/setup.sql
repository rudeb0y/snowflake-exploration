/*
    Set-up some snowflake objects for loading sample stackoverflow data.
    https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/
*/

-- Setting up a file format
create or replace file format stackoverflow_ff
type = 'csv'
COMPRESSION = AUTO
 RECORD_DELIMITER = '\n'
 FIELD_DELIMITER = '|'
 FILE_EXTENSION = 'csv'
 SKIP_HEADER = 1
 SKIP_BLANK_LINES = TRUE
 DATE_FORMAT =  AUTO
 TIME_FORMAT =  AUTO
 TIMESTAMP_FORMAT = AUTO
 ESCAPE = '\\'
 TRIM_SPACE = TRUE
 FIELD_OPTIONALLY_ENCLOSED_BY = '"'
 ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE
 REPLACE_INVALID_CHARACTERS = TRUE
 VALIDATE_UTF8 = TRUE
 EMPTY_FIELD_AS_NULL = TRUE
 SKIP_BYTE_ORDER_MARK = TRUE
 ENCODING = 'UTF16 LE';


 -- tables for stackoverflow sample data.
 CREATE OR REPLACE TABLE badges (
	Id int NOT NULL primary key,
	Name string NOT NULL,
	UserId int NOT NULL,
	Date datetime NOT NULL
);

CREATE TABLE LinkTypes(
	Id int primary key
	,Type string
  ) ;

INSERT INTO linktypes VALUES
    (1, 'Linked')
    ,(3, 'Duplicate');

create or replace TABLE COMMENTS ( ID NUMBER(38,0) NOT NULL
, CREATIONDATE TIMESTAMP_NTZ(9) NOT NULL
, POSTID NUMBER(38,0) NOT NULL
, SCORE NUMBER(38,0)
, TEXT VARCHAR(16777216) NOT NULL
, USERID NUMBER(38,0)
, primary key (ID) );