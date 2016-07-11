DROP TABLE IF EXISTS bb_ext_wrk_hrs CASCADE;

CREATE TABLE bb_ext_wrk_hrs
(
   id            varchar(40)    NOT NULL,
   provider_id   varchar(40)    NOT NULL,
   work_day      timestamp      NOT NULL,
   start_hour    integer        NOT NULL,
   start_minute  integer        NOT NULL,
   end_hour      integer        NOT NULL,
   end_minute    integer        NOT NULL,
   is_active     boolean        DEFAULT true
);

ALTER TABLE bb_ext_wrk_hrs
   ADD CONSTRAINT bb_ext_wrk_hrs_pkey
   PRIMARY KEY (id);
   
CREATE INDEX bb_ext_wrk_hrs_provider_id_idx ON bb_ext_wrk_hrs USING btree (provider_id);

COMMIT;
