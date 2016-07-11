DROP FUNCTION IF EXISTS UPDATE_TIMESTAMP_RANGE() CASCADE;
CREATE OR REPLACE FUNCTION UPDATE_TIMESTAMP_RANGE ()
RETURNS TRIGGER AS $add_range$
BEGIN
	NEW.timestamp_range := tsrange(NEW.begin_timestamp,NEW.end_timestamp,'[)') ;
	RETURN NEW;
END; 
$add_range$ LANGUAGE plpgsql; 

DROP FUNCTION IF EXISTS UPDATE_STARTEND_RANGES() CASCADE;
CREATE OR REPLACE FUNCTION UPDATE_STARTEND_RANGES ()
RETURNS TRIGGER AS $add_range$
BEGIN
	NEW.buffered_timestamp_range := tsrange(NEW.buffered_start_time,NEW.buffered_end_time,'[)') ;
	NEW.timestamp_range := tsrange(NEW.start_time,NEW.end_time,'[)') ;
	RETURN NEW;
END; 
$add_range$ LANGUAGE plpgsql; 
