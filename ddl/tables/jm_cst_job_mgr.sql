DROP TABLE IF EXISTS jm_cst_job_mgr CASCADE;

CREATE TABLE jm_cst_job_mgr
(
   customer_id     varchar(40)    NOT NULL,
   job_manager_id  varchar(40)    NOT NULL
);

COMMIT;
