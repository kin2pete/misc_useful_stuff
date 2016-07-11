DROP TABLE IF EXISTS inv_ord_prc_fee CASCADE;

CREATE TABLE inv_ord_prc_fee
(
   id                     varchar(40)      NOT NULL,
   order_id               varchar(40),
   processing_fee         numeric(11,2),
   created_time           timestamp        NOT NULL,
   created_by             varchar(40),
   stripe_processing_fee  numeric(11,2),
   service_request_id     varchar(40)
);


ALTER TABLE inv_ord_prc_fee
   ADD CONSTRAINT inv_ord_prc_fee_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_ord_prc_fee_service_request_id_idx ON inv_ord_prc_fee USING btree (service_request_id);
CREATE INDEX inv_ord_prc_fee_order_id_idx ON inv_ord_prc_fee USING btree (order_id);

COMMIT;
