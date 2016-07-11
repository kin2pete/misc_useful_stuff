DROP TABLE IF EXISTS shp_svc_prv_crw CASCADE;

CREATE TABLE shp_svc_prv_crw
(
   service_provider_crew_id  integer        NOT NULL,
   service_provider_id       integer        NOT NULL,
   name                      varchar(64),
   register_id               varchar(64),
   is_active                 boolean        NOT NULL
);

COMMIT;
