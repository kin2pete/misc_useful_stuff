DROP TABLE IF EXISTS wf_wrk_itm_sts_sla CASCADE;

CREATE TABLE wf_wrk_itm_sts_sla
(
   status  varchar(32)    NOT NULL,
   hours   integer        NOT NULL
);

COMMIT;
