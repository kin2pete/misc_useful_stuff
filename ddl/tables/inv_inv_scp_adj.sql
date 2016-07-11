DROP TABLE IF EXISTS inv_inv_scp_adj CASCADE;

CREATE TABLE inv_inv_scp_adj
(
   id                    varchar(40)      NOT NULL,
   invoice_line_item_id  varchar(40)      NOT NULL,
   description           varchar(4096),
   labor_rate            numeric(11,2),
   material_rate         numeric(11,2),
   permit_rate           numeric(11,2),
   created_time          timestamp        NOT NULL,
   updated_time          timestamp        NOT NULL,
   status                varchar(40)      NOT NULL
);

COMMIT;
