DROP TABLE IF EXISTS mi_csa CASCADE;

CREATE TABLE mi_csa
(
   csa_code  integer        NOT NULL,
   title     varchar(64)    NOT NULL
);

COMMIT;
