DROP TABLE IF EXISTS shp_srv_svn CASCADE;

CREATE TABLE shp_srv_svn
(
   surveyance_id        integer      NOT NULL,
   service_provider_id  integer      NOT NULL,
   survey_id            integer      NOT NULL,
   created_time         timestamp
);

COMMIT;
