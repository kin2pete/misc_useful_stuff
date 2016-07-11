DROP TABLE IF EXISTS dw_src CASCADE;

CREATE TABLE dw_src
(
   code    varchar(10)    NOT NULL,
   source  varchar(40)    NOT NULL
);

COMMIT;
