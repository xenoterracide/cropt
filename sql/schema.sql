-- I really hate these schema names.
-- I may not like the design later either..
--
-- customer related data (some employees)
   DROP SCHEMA IF EXISTS oc CASCADE;
 CREATE SCHEMA oc;

 CREATE TABLE oc.customer (
	id	BIGINT NOT NULL PRIMARY KEY,
	lname	VARCHAR(255) NOT NULL,
	fname	VARCHAR(255) NOT NULL, 
