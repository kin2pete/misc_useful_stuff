DROP TABLE IF EXISTS inv_pdc_crd CASCADE;

CREATE TABLE inv_pdc_crd
(
   id                  varchar(40)      NOT NULL,
   service_request_id  varchar(40)      NOT NULL,
   credit_type         varchar(100),
   credit_code         varchar(100),
   credit_amount       numeric(11,2)    NOT NULL,
   created_time        timestamp        NOT NULL,
   notes               varchar(4096),
   created_by          varchar(40)
);

ALTER TABLE inv_pdc_crd
   ADD CONSTRAINT inv_pdc_crd_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_pdc_crd_service_request_id_idx ON inv_pdc_crd USING btree (service_request_id);

COMMIT;
