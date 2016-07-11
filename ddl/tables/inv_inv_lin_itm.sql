DROP TABLE IF EXISTS inv_inv_lin_itm CASCADE;

CREATE TABLE inv_inv_lin_itm
(
   id                varchar(40)      NOT NULL,
   bill_id           varchar(40)      NOT NULL,
   ml_item_id        varchar(40),
   line_item_type    varchar(40)      NOT NULL,
   line_item_status  varchar(40)      NOT NULL,
   guaranteed        boolean,
   fixed             boolean,
   description       varchar(4096),
   labor_rate        numeric(11,2)    NOT NULL,
   material_rate     numeric(11,2)    NOT NULL,
   permit_rate       numeric(11,2)    NOT NULL,
   created_time      timestamp        NOT NULL,
   updated_time      timestamp        NOT NULL
);

ALTER TABLE inv_inv_lin_itm
   ADD CONSTRAINT inv_inv_lin_itm_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_inv_lin_itm_bill_id_idx ON inv_inv_lin_itm USING btree (bill_id);
CREATE INDEX inv_inv_lin_itm_ml_item_id_idx ON inv_inv_lin_itm USING btree (ml_item_id);


COMMIT;
