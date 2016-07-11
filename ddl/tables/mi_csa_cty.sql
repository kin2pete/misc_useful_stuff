DROP TABLE IF EXISTS mi_csa_cty CASCADE;

CREATE TABLE mi_csa_cty
(
   csa_code          integer    NOT NULL,
   fips_state_code   integer    NOT NULL,
   fips_county_code  integer    NOT NULL,
   cty_pos_code      char(1)    NOT NULL
);

COMMIT;
