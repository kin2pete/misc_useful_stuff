DROP TABLE IF EXISTS mi_cbsa CASCADE;

CREATE TABLE mi_cbsa
(
   cbsa_code       integer        NOT NULL,
   title           varchar(64)    NOT NULL,
   cbsa_type_code  char(1)        NOT NULL
);

COMMIT;
