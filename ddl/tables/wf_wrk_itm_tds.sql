DROP TABLE IF EXISTS wf_wrk_itm_tds CASCADE;

CREATE TABLE wf_wrk_itm_tds
(
   work_item_todo_id  varchar(40)      NOT NULL,
   work_item_id       varchar(40),
   todo_id            varchar(40),
   notes              varchar(4096),
   status             varchar(32),
   due_time           timestamp        NOT NULL,
   created_time       timestamp        NOT NULL,
   completed_time     timestamp,
   job_manager_id     varchar(40),
   assignment_time    timestamp
);

ALTER TABLE wf_wrk_itm_tds
   ADD CONSTRAINT wf_wrk_itm_tds_pkey
   PRIMARY KEY (work_item_todo_id);

CREATE INDEX wf_wrk_itm_tds_todo_id_idx ON wf_wrk_itm_tds USING btree (todo_id);
CREATE INDEX wf_wrk_itm_tds_work_item_id_idx ON wf_wrk_itm_tds USING btree (work_item_id);
CREATE INDEX wf_wrk_itm_tds_status_idx ON wf_wrk_itm_tds USING btree (status);
CREATE INDEX wf_wrk_itm_tds_job_manager_id_idx ON wf_wrk_itm_tds USING btree (job_manager_id);

COMMIT;
