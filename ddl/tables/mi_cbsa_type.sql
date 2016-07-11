DROP TABLE IF EXISTS mi_cbsa_type CASCADE;

CREATE TABLE mi_cbsa_type
(
   cbsa_type_code  char(1)        NOT NULL,
   name            varchar(32)    NOT NULL
);

COMMIT;
