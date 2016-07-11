DROP TABLE IF EXISTS time_cal_year CASCADE;

CREATE TABLE time_cal_year
(
   cal_year_id       integer      NOT NULL,
   cal_year_num      integer      NOT NULL,
   name              char(4)      NOT NULL,
   is_current        boolean      NOT NULL,
   begin_day_name    char(10)     NOT NULL,
   end_day_name      char(10)     NOT NULL,
   cal_qtr_count     integer      NOT NULL,
   cal_mth_count     integer      NOT NULL,
   day_count         integer      NOT NULL,
   begin_cal_qtr_id  integer      NOT NULL,
   end_cal_qtr_id    integer      NOT NULL,
   begin_cal_mth_id  integer      NOT NULL,
   end_cal_mth_id    integer      NOT NULL,
   begin_day_id      integer      NOT NULL,
   end_day_id        integer      NOT NULL,
   begin_timestamp   timestamp    NOT NULL,
   end_timestamp     timestamp    NOT NULL,   
   timestamp_range	 tsrange 	  DEFAULT NULL
);


ALTER TABLE time_cal_year
   ADD CONSTRAINT time_cal_year_pkey
   PRIMARY KEY (cal_year_id);

CREATE INDEX time_cal_year_name_idx ON time_cal_year USING btree (name);
CREATE INDEX time_cal_year_cal_begin_cal_qtr_id_idx ON time_cal_year USING btree (begin_cal_qtr_id);
CREATE INDEX time_cal_year_cal_end_cal_qtr_id_idx ON time_cal_year USING btree (end_cal_qtr_id);
CREATE INDEX time_cal_year_cal_begin_cal_mth_id_idx ON time_cal_year USING btree (begin_cal_mth_id);
CREATE INDEX time_cal_year_cal_end_cal_mth_id_idx ON time_cal_year USING btree (end_cal_mth_id);
CREATE INDEX time_cal_year_begin_day_id_idx ON time_cal_year USING btree (begin_day_id);
CREATE INDEX time_cal_year_end_day_id_idx ON time_cal_year USING btree (end_day_id);
CREATE INDEX time_cal_year_timestamp_range_idx ON time_cal_year USING gist (timestamp_range);
 
COMMIT;
