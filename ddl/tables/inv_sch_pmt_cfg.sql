DROP TABLE IF EXISTS inv_sch_pmt_cfg CASCADE;

CREATE TABLE inv_sch_pmt_cfg
(
   id                  varchar(40)    NOT NULL,
   default_hours       integer,
   out_of_scope_hours  integer
);

COMMIT;
