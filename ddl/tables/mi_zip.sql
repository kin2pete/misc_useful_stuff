DROP TABLE IF EXISTS mi_zip CASCADE;

CREATE TABLE mi_zip
(
   zip_code          integer        NOT NULL,
   state_abbr        varchar(2)     NOT NULL,
   city_name         varchar(64)    NOT NULL,
   fips_state_code   integer        NOT NULL,
   fips_county_code  integer        NOT NULL,
   cbsa_code         integer        NOT NULL
);

COMMIT;
