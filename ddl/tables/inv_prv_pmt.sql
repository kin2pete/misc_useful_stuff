DROP TABLE IF EXISTS inv_prv_pmt CASCADE;

CREATE TABLE inv_prv_pmt
(
   id                varchar(40)      NOT NULL,
   provider_id       varchar(40)      NOT NULL,
   order_id          varchar(40),
   amount            numeric(11,2)    NOT NULL,
   status            varchar(20)      NOT NULL,
   created_time      timestamp        NOT NULL,
   updated_time      timestamp        NOT NULL,
   transaction_type  varchar(40)      NOT NULL,
   created_by        varchar(40),
   updated_by        varchar(40),
   service_request_id    varchar(40)
);

ALTER TABLE inv_prv_pmt
   ADD CONSTRAINT inv_prv_pmt_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_prv_pmt_provider_id_idx ON inv_prv_pmt USING btree (provider_id);
CREATE INDEX inv_prv_pmt_service_request_id_idx ON inv_prv_pmt USING btree (service_request_id);
CREATE INDEX inv_prv_pmt_order_id_idx ON inv_prv_pmt USING btree (order_id);

COMMIT;
