DROP TABLE IF EXISTS shp_svc_prv_cvg CASCADE;

CREATE TABLE shp_svc_prv_cvg
(
   service_provider_coverage_id  integer        NOT NULL,
   service_provider_id           integer        NOT NULL,
   zipcode                       varchar(16)    NOT NULL
);

COMMIT;
