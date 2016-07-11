DROP TABLE IF EXISTS time_iso_year CASCADE;

CREATE TABLE time_iso_year
(
   iso_year_id        integer      NOT NULL,
   iso_year_num       integer      NOT NULL,
   name               char(4)      NOT NULL,
   is_current         boolean      NOT NULL,
   begin_day_name     char(10)     NOT NULL,
   end_day_name       char(10)     NOT NULL,
   iso_week_count     integer      NOT NULL,
   day_count          integer      NOT NULL,
   begin_iso_week_id  integer      NOT NULL,
   end_iso_week_id    integer      NOT NULL,
   begin_day_id       integer      NOT NULL,
   end_day_id         integer      NOT NULL,
   begin_timestamp    timestamp    NOT NULL,
   end_timestamp      timestamp    NOT NULL,   
   timestamp_range	  tsrange 	   DEFAULT NULL
);

ALTER TABLE time_iso_year
   ADD CONSTRAINT time_iso_year_pkey
   PRIMARY KEY (iso_year_id);

CREATE INDEX time_iso_year_name_idx ON time_iso_year USING btree (name);
CREATE INDEX time_iso_year_cal_begin_iso_week_id_idx ON time_iso_year USING btree (begin_iso_week_id);
CREATE INDEX time_iso_year_cal_end_iso_week_id_idx ON time_iso_year USING btree (end_iso_week_id);
CREATE INDEX time_iso_year_begin_day_id_idx ON time_iso_year USING btree (begin_day_id);
CREATE INDEX time_iso_year_end_day_id_idx ON time_iso_year USING btree (end_day_id);
CREATE INDEX time_iso_year_timestamp_range_idx ON time_iso_year USING gist (timestamp_range);
 
COMMIT;
