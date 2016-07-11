DROP TABLE IF EXISTS jobs_manual_prv CASCADE;

CREATE TABLE jobs_manual_prv
(
   provider             varchar(128)    NOT NULL,
   service_provider_id  integer         NOT NULL
);

COMMIT;
