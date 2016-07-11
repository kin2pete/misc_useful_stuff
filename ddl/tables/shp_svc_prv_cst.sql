DROP TABLE IF EXISTS shp_svc_prv_cst CASCADE;

CREATE TABLE shp_svc_prv_cst
(
   service_provider_customer_id  integer         NOT NULL,
   first_name                    varchar(64),
   last_name                     varchar(64),
   email_address                 varchar(128)    NOT NULL,
   phone_number                  varchar(16),
   service_provider_id           integer         NOT NULL,
   status                        varchar(32),
   service_date                  date,
   created_time                  timestamp       NOT NULL,
   updated_time                  timestamp       NOT NULL
);

COMMIT;
