DROP TABLE IF EXISTS mi_zip_county CASCADE;

CREATE TABLE mi_zip_county
(
   zip_code          integer    NOT NULL,
   fips_state_code   integer    NOT NULL,
   fips_county_code  integer    NOT NULL
);

COMMIT;
