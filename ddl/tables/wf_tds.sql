DROP TABLE IF EXISTS wf_tds CASCADE;

CREATE TABLE wf_tds
(
   id           varchar(40)     NOT NULL,
   title        varchar(512),
   tier         varchar(20),
   todo_key     varchar(50),
   sla_minutes  integer         NOT NULL
);

ALTER TABLE wf_tds
   ADD CONSTRAINT wf_tds_pkey
   PRIMARY KEY (id);

COMMIT;
