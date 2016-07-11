DROP TABLE IF EXISTS build_jobs CASCADE;

CREATE TABLE build_jobs
(
   id            integer        NOT NULL,
   product_type  varchar(60)    NOT NULL,
   zip_code      integer        NOT NULL
);

COMMIT;
