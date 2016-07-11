DROP TABLE IF EXISTS inv_cst_pmt_hst CASCADE;

CREATE TABLE inv_cst_pmt_hst
(
   id                                varchar(40)      NOT NULL,
   customer_payment_id               varchar(40)      NOT NULL,
   time_executed                     timestamp        NOT NULL,
   status                            varchar(40)      NOT NULL,
   created_time                      timestamp        NOT NULL,
   customer_payment_method_id        varchar(40),
   payment_processor_transaction_id  varchar(255),
   error_code                        varchar(255),
   error_message                     varchar(4096),
   created_by                        varchar(40)
);

ALTER TABLE inv_cst_pmt_hst
   ADD CONSTRAINT inv_cst_pmt_hst_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cst_pmt_hst_customer_payment_id_idx ON inv_cst_pmt_hst USING btree (customer_payment_id);

COMMIT;
