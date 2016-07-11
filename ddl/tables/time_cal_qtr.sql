DROP TABLE IF EXISTS time_cal_qtr CASCADE;

CREATE TABLE time_cal_qtr
(
   cal_qtr_id             integer      NOT NULL,
   cal_year_num           integer      NOT NULL,
   qtr_of_cal_year        integer      NOT NULL,
   name                   char(7)      NOT NULL,
   is_current             boolean      NOT NULL,
   begin_day_name         char(10)     NOT NULL,
   end_day_name           char(10)     NOT NULL,
   begin_mth_of_cal_year  integer      NOT NULL,
   end_mth_of_cal_year    integer      NOT NULL,
   cal_mth_count          integer      NOT NULL,
   day_count              integer      NOT NULL,
   cal_year_id            integer      NOT NULL,
   begin_cal_mth_id       integer      NOT NULL,
   end_cal_mth_id         integer      NOT NULL,
   begin_day_id           integer      NOT NULL,
   end_day_id             integer      NOT NULL,
   begin_timestamp        timestamp    NOT NULL,
   end_timestamp          timestamp    NOT NULL,
   timestamp_range	 	  tsrange 	   DEFAULT NULL
);

ALTER TABLE time_cal_qtr
   ADD CONSTRAINT time_cal_qtr_pkey
   PRIMARY KEY (cal_qtr_id);

CREATE INDEX time_cal_qtr_name_idx ON time_cal_qtr USING btree (name);
CREATE INDEX time_cal_qtr_qtr_of_cal_year_idx ON time_cal_qtr USING btree (qtr_of_cal_year);
CREATE INDEX time_cal_qtr_cal_year_id_idx ON time_cal_qtr USING btree (cal_year_id);
CREATE INDEX time_cal_qtr_begin_day_id_idx ON time_cal_qtr USING btree (begin_day_id);
CREATE INDEX time_cal_qtr_end_day_id_idx ON time_cal_qtr USING btree (end_day_id);
CREATE INDEX time_cal_qtr_timestamp_range_idx ON time_cal_qtr USING gist (timestamp_range);
   
COMMIT;
