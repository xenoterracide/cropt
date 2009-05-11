-- vim: ts=8
-- services schema is for the oil change servies

   DROP SCHEMA IF EXISTS service CASCADE;
 CREATE SCHEMA service;

 CREATE TABLE service.services (
	id		SMALLINT	NOT NULL	PRIMARY KEY,
	svc_name	VARCHAR(255)	NOT NULL	UNIQUE,
	cur_price	MONEY
);

