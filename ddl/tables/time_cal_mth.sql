DROP TABLE IF EXISTS time_cal_mth CASCADE;

CREATE TABLE time_cal_mth
(
   cal_mth_id       integer      NOT NULL,
   cal_year_num     integer      NOT NULL,
   mth_of_cal_year  integer      NOT NULL,
   name             char(7)      NOT NULL,
   is_current       boolean      NOT NULL,
   begin_day_name   char(10)     NOT NULL,
   end_day_name     char(10)     NOT NULL,
   qtr_of_cal_year  integer      NOT NULL,
   mth_of_cal_qtr   integer      NOT NULL,
   day_count        integer      NOT NULL,
   cal_qtr_id       integer      NOT NULL,
   cal_year_id      integer      NOT NULL,
   begin_day_id     integer      NOT NULL,
   end_day_id       integer      NOT NULL,
   begin_timestamp  timestamp    NOT NULL,
   end_timestamp    timestamp    NOT NULL,
   timestamp_range	 tsrange 	  DEFAULT NULL
);

ALTER TABLE time_cal_mth
   ADD CONSTRAINT time_cal_mth_pkey
   PRIMARY KEY (cal_mth_id);

CREATE INDEX time_cal_mth_name_idx ON time_cal_mth USING btree (name);
CREATE INDEX time_cal_mth_cal_year_id_idx ON time_cal_mth USING btree (cal_year_id);
CREATE INDEX time_cal_mth_cal_qtr_id_idx ON time_cal_mth USING btree (cal_qtr_id);
CREATE INDEX time_cal_mth_begin_day_id_idx ON time_cal_mth USING btree (begin_day_id);
CREATE INDEX time_cal_mth_end_day_id_idx ON time_cal_mth USING btree (end_day_id);
CREATE INDEX time_cal_mth_timestamp_range_idx ON time_cal_mth USING gist (timestamp_range);

COMMIT;
