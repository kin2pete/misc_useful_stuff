DROP TABLE IF EXISTS mi_fips_county CASCADE;

CREATE TABLE mi_fips_county
(
   fips_state_code   integer        NOT NULL,
   fips_county_code  integer        NOT NULL,
   name              varchar(64)    NOT NULL,
   fips_class_code   char(2)        NOT NULL
);

COMMIT;
