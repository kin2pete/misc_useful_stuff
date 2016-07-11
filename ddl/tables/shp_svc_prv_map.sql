DROP TABLE IF EXISTS shp_svc_prv_map CASCADE;

CREATE TABLE shp_svc_prv_map
(
   service_provider_uuid_mapping_id  varchar(38)    NOT NULL,
   service_provider_id               integer        NOT NULL
);

COMMIT;
