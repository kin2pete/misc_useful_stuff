DROP TABLE IF EXISTS bb_wk_rtn CASCADE;

CREATE TABLE bb_wk_rtn
(
   id            varchar(40)    NOT NULL,
   provider_id   varchar(40)    NOT NULL,
   day_of_week   integer        NOT NULL,
   start_hour    integer        NOT NULL,
   start_minute  integer        NOT NULL,
   end_hour      integer        NOT NULL,
   end_minute    integer        NOT NULL,
   is_active     boolean        DEFAULT true NOT NULL
);

ALTER TABLE bb_wk_rtn
   ADD CONSTRAINT bb_wk_rtn_pkey
   PRIMARY KEY (id);

COMMIT;
