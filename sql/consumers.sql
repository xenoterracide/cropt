-- vim: ts=8
-- after creating the database and correspoding user/pass create tables with
-- psql -1f schema.sql

/*************************************************************************/
/* Consumer schema consist of name/contact info for all potential consumers
 * this includes customers, employees, investors, and any one else
 * **********************************************************************/
   DROP SCHEMA IF EXISTS consumer CASCADE;
 CREATE SCHEMA consumer;

-- the following are skeletal domains
-- they should be expanded in the future to carry stricter validation
 CREATE DOMAIN consumer.zip_t AS CHAR(9);
 CREATE DOMAIN consumer.phone_t AS CHAR(14);
 CREATE DOMAIN consumer.phone_ext_t AS CHAR(4);
 CREATE DOMAIN consumer.state_t AS CHAR(2);
 CREATE DOMAIN consumer.email_t AS VARCHAR(255);

/* CONSUMERS ************************************************************/
 CREATE TABLE consumer.consumers (
	id	BIGINT		NOT NULL PRIMARY KEY,
	lname	VARCHAR(255)	NOT NULL,
	fname	VARCHAR(255)	NOT NULL
);
 CREATE SEQUENCE consumer.consumer_id OWNED BY consumer.consumers.id;

-- set default consumer.consumer.id to sequence
  ALTER	TABLE consumer.consumers
  ALTER COLUMN id
    SET DEFAULT nextval('consumer.consumer_id');

-- following tables split for normalizaton
 CREATE TABLE consumer.phones (
	id	BIGINT		NOT NULL
		REFERENCES consumer.consumers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	phone	phone_t		NOT NULL,
	PRIMARY KEY (id, phone)
);
 CREATE TABLE consumer.addresses (
	id	BIGINT			NOT NULL
		REFERENCES consumer.consumers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	addr1	VARCHAR(255)		NOT NULL,
	addr2	VARCHAR(255),
	city	VARCHAR(255)		NOT NULL,
	state	consumer.state_t	NOT NULL,
	zip	consumer.zip_t		NOT NULL
);
 CREATE TABLE consumer.email (
	id	BIGINT			NOT NULL
		REFERENCES consumer.consumers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	email	consumer.email_t	NOT NULL,
	PRIMARY KEY (id, email)
);
