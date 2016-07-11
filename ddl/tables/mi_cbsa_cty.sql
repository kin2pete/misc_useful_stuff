DROP TABLE IF EXISTS mi_cbsa_cty CASCADE;

CREATE TABLE mi_cbsa_cty
(
   cbsa_code         integer    NOT NULL,
   fips_state_code   integer    NOT NULL,
   fips_county_code  integer    NOT NULL,
   cty_pos_code      char(1)    NOT NULL
);

COMMIT;
