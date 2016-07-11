DROP TABLE IF EXISTS inv_prv_acc CASCADE;

CREATE TABLE inv_prv_acc
(
   id                   varchar(40)      NOT NULL,
   title                varchar(100)     NOT NULL,
   provider_id          varchar(40)      NOT NULL,
   order_id             varchar(40),
   amount               numeric(11,2)    NOT NULL,
   transaction_type     varchar(40)      NOT NULL,
   executed_by          varchar(40)      NOT NULL,
   created_time         timestamp        NOT NULL,
   created_by           varchar(40),
   transaction_id       varchar(255),
   provider_payment_id  varchar(40),
   service_request_id   varchar(40)
);

ALTER TABLE inv_prv_acc
   ADD CONSTRAINT inv_prv_acc_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_prv_acc_provider_id_idx ON inv_prv_acc USING btree (provider_id);
CREATE INDEX inv_prv_acc_service_request_id_idx ON inv_prv_acc USING btree (service_request_id);
CREATE INDEX inv_prv_acc_order_id_idx ON inv_prv_acc USING btree (order_id);
CREATE INDEX inv_prv_acc_provider_payment_id_idx ON inv_prv_acc USING btree (provider_payment_id);
CREATE INDEX inv_prv_acc_transaction_id_idx ON inv_prv_acc USING btree (transaction_id);

COMMIT;
