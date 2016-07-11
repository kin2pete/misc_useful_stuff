DROP TABLE IF EXISTS fb_inv_lin CASCADE;

CREATE TABLE fb_inv_lin
(
   invoice_id    integer          NOT NULL,
   line_id       integer          NOT NULL,
   line_order    integer          NOT NULL,
   name          varchar(128),
   description   varchar(4096),
   unit_cost     numeric(11,2)    NOT NULL,
   quantity      numeric(11,2)    NOT NULL,
   amount        numeric(11,2)    NOT NULL,
   tax1_name     varchar(128),
   tax1_percent  numeric(11,2),
   tax2_name     varchar(128),
   tax2_percent  numeric(11,2),
   compound_tax  numeric(11,2)    NOT NULL,
   type          varchar(40)
);

COMMIT;
