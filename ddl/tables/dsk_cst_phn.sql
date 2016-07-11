DROP TABLE IF EXISTS dsk_cst_phn CASCADE;

CREATE TABLE dsk_cst_phn
(
   customer_id  integer        NOT NULL,
   idx          smallint       NOT NULL,
   type         varchar(20)    NOT NULL,
   phone_id     char(40)       NOT NULL
);

COMMIT;
