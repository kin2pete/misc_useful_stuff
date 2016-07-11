DROP TABLE IF EXISTS mi_met_div CASCADE;

CREATE TABLE mi_met_div
(
   met_div_code  integer        NOT NULL,
   title         varchar(64)    NOT NULL,
   cbsa_code     integer        NOT NULL
);

COMMIT;
