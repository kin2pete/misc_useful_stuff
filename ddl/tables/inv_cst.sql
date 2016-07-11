DROP TABLE IF EXISTS inv_cst CASCADE;

CREATE TABLE inv_cst
(
   id                  varchar(40)    NOT NULL,
   customer_id         varchar(40)    NOT NULL,
   stripe_customer_id  varchar(40),
   created_time        timestamp      NOT NULL,
   created_by          varchar(40)
);

ALTER TABLE inv_cst
   ADD CONSTRAINT inv_cst_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cst_customer_id_idx ON inv_cst USING btree (customer_id);
CREATE INDEX inv_cst_stripe_customer_id_idx ON inv_cst USING btree (stripe_customer_id);

COMMIT;
