DROP TABLE IF EXISTS jm_job_mgr_avl CASCADE;

CREATE TABLE jm_job_mgr_avl
(
   id                 varchar(40)     NOT NULL,
   name               varchar(100)    NOT NULL,
   is_available       boolean         NOT NULL,
   job_manager_group  varchar(40)     NOT NULL,
   sequence           integer         NOT NULL,
   tier               varchar(16)
);

COMMIT;
