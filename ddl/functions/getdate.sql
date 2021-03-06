CREATE OR REPLACE FUNCTION GETDATE ()
RETURNS TIMESTAMP WITHOUT TIME ZONE AS $$
DECLARE the_current_time TIMESTAMP WITHOUT TIME ZONE;
BEGIN
	SELECT CURRENT_TIMESTAMP INTO the_current_time;
	RETURN the_current_time;
END; 
$$ LANGUAGE plpgsql;