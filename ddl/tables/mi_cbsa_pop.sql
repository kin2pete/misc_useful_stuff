DROP TABLE IF EXISTS mi_cbsa_pop CASCADE;

CREATE TABLE mi_cbsa_pop
(
   cbsa_code     integer         NOT NULL,
   cbsa_name     varchar(128)    NOT NULL,
   pop_est_2013  integer         NOT NULL
);

COMMIT;
