-- vim: ts=8
-- after creating the database and correspoding user/pass create tables with
-- psql -1f schema.sql
   DROP SCHEMA IF EXISTS oc CASCADE;
 CREATE SCHEMA oc;

 
/* CUSTOMER *************************************************************/
 CREATE TABLE oc.customer (
	id	BIGINT		NOT NULL PRIMARY KEY,
	lname	VARCHAR(255)	NOT NULL,
	fname	VARCHAR(255)	NOT NULL,
	addr1	VARCHAR(255),
	addr2	VARCHAR(255),
	city	VARCHAR(255),
	state	CHAR(2),
	phone	VARCHAR(10) -- might be short
);
 CREATE SEQUENCE oc.customer_id OWNED BY oc.customer.id;

-- set default oc.customer.id to sequence
  ALTER	TABLE oc.customer
  ALTER COLUMN id
    SET DEFAULT nextval('oc.customer_id');
/************************************************************** CUSTOMER */
