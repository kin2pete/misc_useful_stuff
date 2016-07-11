DROP TABLE IF EXISTS wf_wrk_itm_act CASCADE;

CREATE TABLE wf_wrk_itm_act
(
   work_item_activity_id  varchar(40)      NOT NULL,
   work_item_id           varchar(40)      NOT NULL,
   user_id                varchar(40),
   status                 varchar(50)      NOT NULL,
   created_time           timestamp        NOT NULL,
   ml_state               varchar(32),
   details                varchar(4096)
);

ALTER TABLE wf_wrk_itm_act
   ADD CONSTRAINT wf_wrk_itm_act_pkey
   PRIMARY KEY (work_item_activity_id);

CREATE INDEX wf_wrk_itm_act_work_item_activity_id_idx ON wf_wrk_itm_act USING btree (work_item_activity_id);
CREATE INDEX wf_wrk_itm_act_work_item_id_idx ON wf_wrk_itm_act USING btree (work_item_id);
CREATE INDEX wf_wrk_itm_act_status_idx ON wf_wrk_itm_act USING btree (status);

COMMIT;
