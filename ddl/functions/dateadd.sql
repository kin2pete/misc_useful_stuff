-- + 	date '2001-09-28' + integer '7' 	date '2001-10-05'
-- + 	date '2001-09-28' + interval '1 hour' 	timestamp '2001-09-28 01:00:00'
-- + 	date '2001-09-28' + time '03:00' 	timestamp '2001-09-28 03:00:00'
-- + 	interval '1 day' + interval '1 hour' 	interval '1 day 01:00:00'
-- + 	timestamp '2001-09-28 01:00' + interval '23 hours' 	timestamp '2001-09-29 00:00:00'
-- + 	time '01:00' + interval '3 hours' 	time '04:00:00'
CREATE OR REPLACE FUNCTION MINUTE() RETURNS INTEGER AS $$ BEGIN RETURN 5; END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION HOUR() RETURNS INTEGER AS $$ BEGIN RETURN 4; END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION DAY() RETURNS INTEGER AS $$ BEGIN RETURN 1; END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION MONTH() RETURNS INTEGER AS $$ BEGIN RETURN 2; END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION YEAR() RETURNS INTEGER AS $$ BEGIN RETURN 3; END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION DATEADD (interval_to_add INTEGER, time_to_add INTEGER, time_to_increment TIMESTAMP WITHOUT TIME ZONE)
RETURNS TIMESTAMP WITHOUT TIME ZONE AS $$
DECLARE ret TIMESTAMP WITHOUT TIME ZONE;
BEGIN
	IF (interval_to_add=1) THEN
		SELECT (time_to_increment + (time_to_add *interval'1 day')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=2) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 month')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=3) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 year')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=4) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 hour')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=5) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 minute')) INTO ret; 
		RETURN ret;
	ELSE	
		RETURN 0;
	END IF;
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION DATEADD (interval_to_add INTEGER, time_to_add INTEGER, time_to_increment TIMESTAMP WITH TIME ZONE)
RETURNS TIMESTAMP WITH TIME ZONE AS $$
DECLARE ret TIMESTAMP WITH TIME ZONE;
BEGIN
	IF (interval_to_add=1) THEN
		SELECT (time_to_increment + (time_to_add *interval'1 day')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=2) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 month')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=3) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 year')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=4) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 hour')) INTO ret; 
		RETURN ret;
	ELSIF (interval_to_add=5) THEN 
		SELECT (time_to_increment + (time_to_add *interval'1 minute')) INTO ret; 
		RETURN ret;
	ELSE	
		RETURN 0;
	END IF;
END;
$$ LANGUAGE plpgsql;
