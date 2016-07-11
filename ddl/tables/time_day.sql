DROP TABLE IF EXISTS time_day CASCADE;

CREATE TABLE time_day
(
   day_id            integer      NOT NULL,
   cal_year_num      integer      NOT NULL,
   mth_of_cal_year   integer      NOT NULL,
   day_of_cal_mth    integer      NOT NULL,
   name              char(10)     NOT NULL,
   is_current        boolean      NOT NULL,
   day_of_cal_year   integer      NOT NULL,
   qtr_of_cal_year   integer      NOT NULL,
   mth_of_cal_qtr    integer      NOT NULL,
   day_of_cal_qtr    integer      NOT NULL,
   iso_year_num      integer      NOT NULL,
   day_of_iso_year   integer      NOT NULL,
   week_of_iso_year  integer      NOT NULL,
   day_of_iso_week   integer      NOT NULL,
   cal_year_id       integer      NOT NULL,
   cal_qtr_id        integer      NOT NULL,
   cal_mth_id        integer      NOT NULL,
   iso_year_id       integer      NOT NULL,
   iso_week_id       integer      NOT NULL,
   begin_timestamp   timestamp    NOT NULL,
   end_timestamp     timestamp    NOT NULL,
   timestamp_range	 tsrange 	  DEFAULT NULL
);

ALTER TABLE time_day
   ADD CONSTRAINT time_day_pkey
   PRIMARY KEY (day_id);

CREATE INDEX time_day_name_idx ON time_day USING btree (name);
CREATE INDEX time_day_day_id_idx ON time_day USING btree (day_id);
CREATE INDEX time_day_cal_year_id_idx ON time_day USING btree (cal_year_id);
CREATE INDEX time_day_cal_qtr_id_idx ON time_day USING btree (cal_qtr_id);
CREATE INDEX time_day_cal_mth_id_idx ON time_day USING btree (cal_mth_id);
CREATE INDEX time_day_iso_week_id_idx ON time_day USING btree (iso_week_id);
CREATE INDEX time_day_timestamp_range_idx ON time_day USING gist (timestamp_range);

COMMIT;
