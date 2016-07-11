DROP TABLE IF EXISTS mi_fips_state CASCADE;

CREATE TABLE mi_fips_state
(
   fips_state_code  integer        NOT NULL,
   usps_state_code  char(2)        NOT NULL,
   name             varchar(64)    NOT NULL,
   gnis_id          bigint         NOT NULL
);

COMMIT;
