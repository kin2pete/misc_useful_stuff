CREATE OR REPLACE FUNCTION CONVERT_TIMEZONE (timezone_from TEXT, timezone_to TEXT, time_to_convert TIMESTAMP WITHOUT TIME ZONE)
RETURNS TIMESTAMP WITH TIME ZONE AS $$
DECLARE returned_time TIMESTAMP WITH TIME ZONE;
BEGIN
	SELECT (time_to_convert AT TIME ZONE timezone_from) INTO returned_time;
	SELECT (returned_time AT TIME ZONE timezone_to) INTO returned_time;
	RETURN returned_time;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION CONVERT_TIMEZONE (timezone_to TEXT, time_to_convert TIMESTAMP WITHOUT TIME ZONE)
RETURNS TIMESTAMP WITH TIME ZONE AS $$
DECLARE returned_time TIMESTAMP WITH TIME ZONE;
BEGIN
	SELECT (time_to_convert AT TIME ZONE timezone_to) INTO returned_time;
	RETURN returned_time;
END; 
$$ LANGUAGE plpgsql