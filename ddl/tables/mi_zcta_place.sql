DROP TABLE IF EXISTS mi_zcta_place CASCADE;

CREATE TABLE mi_zcta_place
(
   zcta_code            integer    NOT NULL,
   fips_state_code      integer    NOT NULL,
   fips_place_code      integer    NOT NULL,
   place_class          char(2)    NOT NULL,
   place_geoid          integer    NOT NULL,
   population           integer    NOT NULL,
   housing_units        integer    NOT NULL,
   area_total           bigint     NOT NULL,
   area_land            bigint     NOT NULL,
   zcta_pop             integer    NOT NULL,
   zcta_housing_units   integer    NOT NULL,
   zcta_area_total      bigint     NOT NULL,
   zcta_area_land       bigint     NOT NULL,
   place_pop            integer    NOT NULL,
   place_housing_units  integer    NOT NULL,
   place_area_total     bigint     NOT NULL,
   place_area_land      bigint     NOT NULL
);

COMMIT;
