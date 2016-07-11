DROP TABLE IF EXISTS dsk_cst_adr CASCADE;

CREATE TABLE dsk_cst_adr
(
   customer_id  integer        NOT NULL,
   idx          smallint       NOT NULL,
   type         varchar(20)    NOT NULL,
   address_id   char(40)       NOT NULL
);

COMMIT;
