DROP TABLE IF EXISTS shp_expt CASCADE;

CREATE TABLE shp_expt
(
   id            integer,
   name          varchar(255),
   status        varchar(255),
   created_time  timestamp,
   updated_time  timestamp
);

COMMIT;
