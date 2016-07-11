DROP TABLE IF EXISTS build_jobs CASCADE;

CREATE TABLE build_jobs
(
   id            integer        NOT NULL,
   product_type  varchar(60)    NOT NULL,
   zip_code      integer        NOT NULL
);

ALTER TABLE build_jobs
   ADD CONSTRAINT build_jobs_pkey
   PRIMARY KEY (id);
   
CREATE INDEX build_jobs_product_type_idx ON build_jobs USING btree (product_type);
CREATE INDEX build_jobs_zip_code_idx ON build_jobs USING btree (zip_code);

COMMIT;
