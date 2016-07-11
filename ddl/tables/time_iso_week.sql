DROP TABLE IF EXISTS time_iso_week CASCADE;

CREATE TABLE time_iso_week
(
   iso_week_id       integer      NOT NULL,
   iso_year_num      integer      NOT NULL,
   week_of_iso_year  integer      NOT NULL,
   name              char(7)      NOT NULL,
   is_current        boolean      NOT NULL,
   begin_day_name    char(10)     NOT NULL,
   end_day_name      char(10)     NOT NULL,
   day_count         integer      NOT NULL,
   iso_year_id       integer      NOT NULL,
   begin_day_id      integer      NOT NULL,
   end_day_id        integer      NOT NULL,
   begin_timestamp   timestamp    NOT NULL,
   end_timestamp     timestamp    NOT NULL,   
   timestamp_range	 tsrange 	  DEFAULT NULL
);

ALTER TABLE time_iso_week
   ADD CONSTRAINT time_iso_week_pkey
   PRIMARY KEY (iso_week_id);

CREATE INDEX time_iso_week_name_idx ON time_iso_week USING btree (name);
CREATE INDEX time_iso_week_iso_year_id_idx ON time_iso_week USING btree (iso_year_id);
CREATE INDEX time_iso_week_begin_day_id_idx ON time_iso_week USING btree (begin_day_id);
CREATE INDEX time_iso_week_end_day_id_idx ON time_iso_week USING btree (end_day_id);
CREATE INDEX time_iso_week_timestamp_range_idx ON time_iso_week USING gist (timestamp_range);

COMMIT;
