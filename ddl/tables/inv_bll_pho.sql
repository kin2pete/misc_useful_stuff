DROP TABLE IF EXISTS inv_bll_pho CASCADE;

CREATE TABLE inv_bll_pho
(
   id            varchar(40)      NOT NULL,
   bill_id       varchar(40)      NOT NULL,
   url           varchar(4096)    NOT NULL,
   created_time  timestamp        NOT NULL,
   updated_time  timestamp        NOT NULL
);

COMMIT;
