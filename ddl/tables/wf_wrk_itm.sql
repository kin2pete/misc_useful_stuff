DROP TABLE IF EXISTS wf_wrk_itm CASCADE;

CREATE TABLE wf_wrk_itm
(
   work_item_id       varchar(40)    NOT NULL,
   work_type          varchar(50),
   associated_id      varchar(40),
   entity_type        varchar(50),
   status             varchar(32),
   user_id            varchar(40),
   ml_state           varchar(32),
   created_time       timestamp,
   updated_time       timestamp,
   lock_status        varchar(40),
   zipcode            varchar(16),
   priority           integer        NOT NULL,
   workflow_strategy  varchar(40),
   sla_breached       boolean        NOT NULL,
   sla_expiry_time    timestamp
);

ALTER TABLE wf_wrk_itm
   ADD CONSTRAINT wf_wrk_itm_pkey
   PRIMARY KEY (work_item_id);
   
CREATE INDEX wf_wrk_itm_work_item_id_idx ON wf_wrk_itm USING btree (work_item_id);
CREATE INDEX wf_wrk_itm_associated_id_idx ON wf_wrk_itm USING btree (associated_id);
CREATE INDEX wf_wrk_itm_status_idx ON wf_wrk_itm USING btree (status);
   
COMMIT;
