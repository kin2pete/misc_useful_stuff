DROP TABLE IF EXISTS mi_met_div_cty CASCADE;

CREATE TABLE mi_met_div_cty
(
   met_div_code      integer    NOT NULL,
   fips_state_code   integer    NOT NULL,
   fips_county_code  integer    NOT NULL,
   cty_pos_code      char(1)    NOT NULL
);

COMMIT;
