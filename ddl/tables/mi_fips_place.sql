DROP TABLE IF EXISTS mi_fips_place CASCADE;

CREATE TABLE mi_fips_place
(
   fips_state_code    integer         NOT NULL,
   fips_place_code    integer         NOT NULL,
   name               varchar(128)    NOT NULL,
   place_type_name    varchar(64)     NOT NULL,
   functional_status  char(1)         NOT NULL,
   county_names       varchar(256)    NOT NULL
);

COMMIT;
