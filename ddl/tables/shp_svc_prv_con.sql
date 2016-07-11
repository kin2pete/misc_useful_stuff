DROP TABLE IF EXISTS shp_svc_prv_con CASCADE;

CREATE TABLE shp_svc_prv_con
(
   contract_id           varchar(152),
   effective_start_date  timestamp,
   effective_end_date    timestamp,
   terms_and_conditions  varchar(4096),
   user_id               varchar(160),
   contract_status       varchar(160),
   publish_time          timestamp,
   created_time          timestamp,
   updated_time          timestamp,
   provider_action_time  timestamp,
   contract_template     varchar(4096)
);

COMMIT;
