 CREATE TABLE consumer.vehicles (
	consumer_id	BIGINT	NOT NULL
		REFERENCES consumer.consumers (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	vehicle_id	BIGINT	NOT NULL
		REFERENCES vehicle.vehicles (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	PRIMARY KEY ( consumer_id, vehicle_id )
);
