DROP TABLE IF EXISTS inv_cst_pmt_mth CASCADE;

CREATE TABLE inv_cst_pmt_mth
(
   id                    varchar(40)     NOT NULL,
   customer_id           varchar(40)     NOT NULL,
   processor_token       varchar(255),
   payment_processor_id  varchar(40),
   created_time          timestamp       NOT NULL,
   updated_time          timestamp       NOT NULL,
   status                varchar(20),
   created_by            varchar(40),
   updated_by            varchar(40)
);

ALTER TABLE inv_cst_pmt_mth
   ADD CONSTRAINT inv_cst_pmt_mth_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cst_pmt_mth_customer_id_idx ON inv_cst_pmt_mth USING btree (customer_id);
CREATE INDEX inv_cst_pmt_mth_payment_processor_id_idx ON inv_cst_pmt_mth USING btree (payment_processor_id);

COMMIT;
