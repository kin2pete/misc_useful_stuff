DROP TABLE IF EXISTS inv_bll CASCADE;

CREATE TABLE inv_bll
(
   id                 varchar(40)      NOT NULL,
   order_id           varchar(255),
   status             varchar(40)      NOT NULL,
   invoiced_at        timestamp        NOT NULL,
   labor_rate         numeric(11,2)    NOT NULL,
   material_rate      numeric(11,2)    NOT NULL,
   tax_rate           numeric(11,2)    NOT NULL,
   bill_type          varchar(50),
   created_time       timestamp        NOT NULL,
   updated_time       timestamp        NOT NULL,
   sr_id              varchar(255),
   notes              varchar(4096),
   assignment_id      varchar(255),
   permit_rate        numeric(11,2)    NOT NULL,
   tax_applied_on     varchar(255),
   sales_tax_percent  numeric(6,4),
   tax_base_rate      numeric(11,2),
   old_invoice        boolean          NOT NULL
);

ALTER TABLE inv_bll
   ADD CONSTRAINT inv_bll_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_bll_sr_id_idx ON inv_bll USING btree (sr_id);
CREATE INDEX inv_bll_order_id_idx ON inv_bll USING btree (order_id);
CREATE INDEX inv_bll_assignment_id_idx ON inv_bll USING btree (assignment_id);

COMMIT;
