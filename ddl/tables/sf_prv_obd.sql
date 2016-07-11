DROP TABLE IF EXISTS sf_prv_obd CASCADE;

CREATE TABLE sf_prv_obd
(
   id                      varchar(64)    NOT NULL,
   name                    varchar(64)    NOT NULL,
   state                   varchar(16)    NOT NULL,
   onboarding_initiated    boolean        NOT NULL,
   service_provider_id     integer,
   close_date              date,
   full_name               varchar(64),
   last_state_change_date  date,
   last_update_by          varchar(64)    NOT NULL,
   last_update_by_alias    varchar(64)    NOT NULL,
   opportunity_name        varchar(64)    NOT NULL,
   stage                   varchar(64),
   account_created         boolean        NOT NULL
);

COMMIT;
