DROP TABLE IF EXISTS inv_cst_pmt CASCADE;

CREATE TABLE inv_cst_pmt
(
   id                    varchar(40)      NOT NULL,
   customer_id           varchar(40)      NOT NULL,
   order_id              varchar(40),
   amount                numeric(11,2)    NOT NULL,
   status                varchar(40)      NOT NULL,
   time_to_execute       timestamp,
   created_time          timestamp        NOT NULL,
   updated_time          timestamp        NOT NULL,
   payment_processor_id  varchar(40),
   transaction_type      varchar(40)      NOT NULL,
   created_by            varchar(40),
   updated_by            varchar(40),
   service_request_id    varchar(40)
);

ALTER TABLE inv_cst_pmt
   ADD CONSTRAINT inv_cst_pmt_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cst_pmt_customer_id_idx ON inv_cst_pmt USING btree (customer_id);
CREATE INDEX inv_cst_pmt_payment_processor_id_idx ON inv_cst_pmt USING btree (payment_processor_id);
CREATE INDEX inv_cst_pmt_order_id_idx ON inv_cst_pmt USING btree (order_id);
CREATE INDEX inv_cst_pmt_service_request_id_idx ON inv_cst_pmt USING btree (service_request_id);

COMMIT;
