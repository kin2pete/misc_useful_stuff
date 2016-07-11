DROP TABLE IF EXISTS dsk_cst_eml CASCADE;

CREATE TABLE dsk_cst_eml
(
   customer_id  integer        NOT NULL,
   idx          smallint       NOT NULL,
   type         varchar(20)    NOT NULL,
   email_id     char(40)       NOT NULL
);

COMMIT;
