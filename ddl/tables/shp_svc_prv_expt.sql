DROP TABLE IF EXISTS shp_svc_prv_expt CASCADE;

CREATE TABLE shp_svc_prv_expt
(
   id             integer,
   provider_id    integer,
   experiment_id  integer,
   status         varchar(255),
   created_time   timestamp,
   updated_time   timestamp
);

COMMIT;
