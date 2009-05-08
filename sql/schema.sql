-- vim: ts=8
-- after creating the database and correspoding user/pass create tables with
-- psql -1f schema.sql
   DROP SCHEMA IF EXISTS oc CASCADE;
 CREATE SCHEMA oc;

-- the following are skeletal domains
-- they should be expanded in the future to carry stricter validation
 CREATE DOMAIN zip_t AS CHAR(9);
 CREATE DOMAIN phone_t AS CHAR(14);
 CREATE DOMAIN phone_ext_t AS CHAR(4);
 CREATE DOMAIN state_t AS CHAR(2);
 CREATE DOMAIN vin_t AS CHAR(17); --vehicle identification number
 CREATE	DOMAIN email_t AS VARCHAR(255);

/* CUSTOMERS ************************************************************/
 CREATE TABLE oc.customers (
	id	BIGINT		NOT NULL PRIMARY KEY,
	lname	VARCHAR(255)	NOT NULL,
	fname	VARCHAR(255)	NOT NULL,
	addr1	VARCHAR(255),
	addr2	VARCHAR(255),
	zip	zip_t,
	city	VARCHAR(255),
	state	state_t,
	email	email_t
);
 CREATE SEQUENCE oc.customer_id OWNED BY oc.customers.id;

-- set default oc.customer.id to sequence
  ALTER	TABLE oc.customers
  ALTER COLUMN id
    SET DEFAULT nextval('oc.customer_id');
/************************************************************* CUSTOMERS */

/* VEHICLES **************************************************************/
