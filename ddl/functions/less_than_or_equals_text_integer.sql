CREATE OR REPLACE FUNCTION LESS_THAN_OR_EQUALS_TEXT_INTEGER (textarg TEXT, intarg INTEGER)
RETURNS BOOLEAN AS $$
BEGIN
	IF (textarg::INTEGER<=intarg) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LESS_THAN_OR_EQUALS_TEXT_INTEGER (intarg INTEGER, textarg TEXT)
RETURNS BOOLEAN AS $$
BEGIN
	IF (textarg::INTEGER=>intarg) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END; 
$$ LANGUAGE plpgsql;