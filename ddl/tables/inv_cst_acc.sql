DROP TABLE IF EXISTS inv_cst_acc CASCADE;

CREATE TABLE inv_cst_acc
(
   id                                varchar(40)      NOT NULL,
   title                             varchar(100)     NOT NULL,
   customer_id                       varchar(40)      NOT NULL,
   order_id                          varchar(40),
   amount                            numeric(11,2)    NOT NULL,
   transaction_type                  varchar(40)      NOT NULL,
   executed_by                       varchar(40)      NOT NULL,
   created_time                      timestamp        NOT NULL,
   payment_processor_transaction_id  varchar(255),
   created_by                        varchar(40),
   customer_payment_id               varchar(40),
   parent_transaction_id             varchar(128),
   service_request_id    			 varchar(40)
);

ALTER TABLE inv_cst_acc
   ADD CONSTRAINT inv_cst_acc_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cst_acc_customer_id_idx ON inv_cst_acc USING btree (customer_id);
CREATE INDEX inv_cst_acc_service_request_id_idx ON inv_cst_acc USING btree (service_request_id);
CREATE INDEX inv_cst_acc_order_id_idx ON inv_cst_acc USING btree (order_id);
CREATE INDEX inv_cst_acc_payment_processor_transaction_id_idx ON inv_cst_acc USING btree (payment_processor_transaction_id);
CREATE INDEX inv_cst_acc_customer_payment_id_idx ON inv_cst_acc USING btree (customer_payment_id);
CREATE INDEX inv_cst_acc_parent_transaction_id_idx ON inv_cst_acc USING btree (parent_transaction_id);

COMMIT;
