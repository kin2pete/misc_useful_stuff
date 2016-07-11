DROP TABLE IF EXISTS dw_abr CASCADE;

CREATE TABLE dw_abr
(
   code         varchar(10)     NOT NULL,
   description  varchar(100)    NOT NULL
);

COMMIT;
