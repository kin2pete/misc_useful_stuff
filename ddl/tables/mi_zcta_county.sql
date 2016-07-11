DROP TABLE IF EXISTS mi_zcta_county CASCADE;

CREATE TABLE mi_zcta_county
(
   zcta_code             integer    NOT NULL,
   fips_state_code       integer    NOT NULL,
   fips_county_code      integer    NOT NULL,
   county_geoid          integer    NOT NULL,
   population            integer    NOT NULL,
   housing_units         integer    NOT NULL,
   area_total            bigint     NOT NULL,
   area_land             bigint     NOT NULL,
   zcta_pop              integer    NOT NULL,
   zcta_housing_units    integer    NOT NULL,
   zcta_area_total       bigint     NOT NULL,
   zcta_area_land        bigint     NOT NULL,
   county_pop            integer    NOT NULL,
   county_housing_units  integer    NOT NULL,
   county_area_total     bigint     NOT NULL,
   county_area_land      bigint     NOT NULL
);

COMMIT;
