DROP OPERATOR = (TEXT,INTEGER);
CREATE OPERATOR = (  
	PROCEDURE = equals_text_integer,
	LEFTARG = TEXT,
	RIGHTARG = INTEGER,
	COMMUTATOR = =,
	NEGATOR = !=

);

DROP OPERATOR = (INTEGER, TEXT);
CREATE OPERATOR = (  
	PROCEDURE = equals_text_integer,
	LEFTARG = INTEGER,
	RIGHTARG = TEXT,
	COMMUTATOR = =,
	NEGATOR = !=

);



