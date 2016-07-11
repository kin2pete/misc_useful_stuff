DROP TABLE IF EXISTS mi_zcta_cbsa CASCADE;

CREATE TABLE mi_zcta_cbsa
(
   zcta_code           integer     NOT NULL,
   cbsa_code           integer     NOT NULL,
   memi                smallint    NOT NULL,
   population          integer     NOT NULL,
   housing_units       integer     NOT NULL,
   area_total          bigint      NOT NULL,
   area_land           bigint      NOT NULL,
   zcta_pop            integer     NOT NULL,
   zcta_housing_units  integer     NOT NULL,
   zcta_area_total     bigint      NOT NULL,
   zcta_area_land      bigint      NOT NULL,
   cbsa_pop            integer     NOT NULL,
   cbsa_housing_units  integer     NOT NULL,
   cbsa_area_total     bigint      NOT NULL,
   cbsa_area_land      bigint      NOT NULL
);

COMMIT;
