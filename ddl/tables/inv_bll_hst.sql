DROP TABLE IF EXISTS inv_bll_hst CASCADE;

CREATE TABLE inv_bll_hst
(
   id            varchar(40)      NOT NULL,
   bill_id       varchar(40)      NOT NULL,
   tax_rate      numeric(11,2)    NOT NULL,
   created_time  timestamp        NOT NULL,
   created_by    varchar(40)
);
ALTER TABLE inv_bll_hst
   ADD CONSTRAINT inv_bll_hst_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_bll_hst_bill_id_idx ON inv_bll_hst USING btree (bill_id);

COMMIT;
