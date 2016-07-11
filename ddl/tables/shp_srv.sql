DROP TABLE IF EXISTS shp_srv CASCADE;

CREATE TABLE shp_srv
(
   survey_id           integer          NOT NULL,
   survey_name         varchar(256)     NOT NULL,
   survey_description  varchar(4096),
   created_time        timestamp
);

COMMIT;
