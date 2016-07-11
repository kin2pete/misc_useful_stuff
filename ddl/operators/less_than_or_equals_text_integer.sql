DROP OPERATOR <= (TEXT, INTEGER);
CREATE OPERATOR <= (  
	PROCEDURE = less_than_or_equals_text_integer,
	LEFTARG = TEXT,
	RIGHTARG = INTEGER,
	COMMUTATOR = =>,
	NEGATOR = >

);

DROP OPERATOR => (INTEGER, TEXT);
CREATE OPERATOR => (  
	PROCEDURE = less_than_or_equals_text_integer,
	LEFTARG = INTEGER,
	RIGHTARG = TEXT,
	COMMUTATOR = <=,
	NEGATOR = <

);


