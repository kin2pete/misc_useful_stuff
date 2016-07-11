DROP TABLE IF EXISTS jm_job_mgr_avl_hst CASCADE;

CREATE TABLE jm_job_mgr_avl_hst
(
   id                       varchar(160)    NOT NULL,
   job_manager_id           varchar(160)    NOT NULL,
   availability_start_time  timestamp,
   availability_end_time    timestamp
);

COMMIT;
