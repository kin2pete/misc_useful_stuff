DROP TABLE IF EXISTS jobs_manual_cst CASCADE;

CREATE TABLE jobs_manual_cst
(
   customer     varchar(128)    NOT NULL,
   customer_id  varchar(38)     NOT NULL
);

COMMIT;
