-- vim: ts=8

/*************************************************************************
 * vehicle schema consists of all vehicle information
 * this entire schema should be re-worked to validate all data
 * **********************************************************************/
   DROP SCHEMA IF EXISTS vehicle CASCADE;
 CREATE SCHEMA vehicle;

 CREATE DOMAIN vehicle.vin_t AS CHAR(17);
-- id's should refer to the vin number specification, these may not be int's
-- more reasearch needs to be done
 CREATE TABLE vehicle.manufacturers (
	id	SMALLINT	NOT NULL	PRIMARY KEY,
	name	VARCHAR(255)	NOT NULL	UNIQUE
);

 CREATE TABLE vehicle.model (
	id	SMALLINT	NOT NULL	PRIMARY KEY,
	name	VARCHAR(255)	NOT NULL,
	man_id	SMALLINT	NOT NULL
		REFERENCES vehicle.manufacturers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	UNIQUE (name, man_id)
);

 CREATE TABLE vehicle.vehicles (
	id	BIGINT		NOT NULL	PRIMARY KEY,
	make	SMALLINT	NOT NULL
		REFERENCES vehicle.manufacturers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	model	SMALLINT	NOT NULL
		REFERENCES vehicle.model (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	year	SMALLINT	NOT NULL,
	color	VARCHAR(25)	NOT NULL,
	vin	vehicle.vin_t	NOT NULL	UNIQUE
);
