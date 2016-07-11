DROP TABLE IF EXISTS service_providers CASCADE;

CREATE TABLE service_providers
(
   service_provider_id                 integer          NOT NULL,
   service_provider_key                varchar(4096)    NOT NULL,
   service_provider_name               varchar(256)     NOT NULL,
   service_provider_display_name       varchar(256)     NOT NULL,
   service_provider_logo_url           varchar(4096),
   service_provider_photo_url          varchar(4096),
   service_provider_about_description  varchar(4096),
   service_provider_phone_number       varchar(50),
   service_provider_email_address      varchar(4096)    NOT NULL,
   customer_survey_count               integer,
   customer_survey_recommend_count     integer,
   password_digest                     varchar(64)      NOT NULL,
   service_provider_type               varchar(64),
   owner_name                          varchar(255),
   annual_revenue                      numeric(15,2),
   notes                               varchar(4096),
   self_service                        boolean,
   status                              varchar(15),
   is_active                           boolean,
   owner_moniker                       varchar(4096),
   background_checked                  boolean,
   business_started_year               integer,
   call_priority                       integer,
   referral_status                     varchar(255),
   licensed                            boolean,
   bonded                              boolean,
   insured                             boolean,
   primary_trade_id                    varchar(40),
   feedback_pro_user                   boolean,
   service_provider_website_url        varchar(4096),
   working_hours                       varchar(4096),
   owner_photo_url                     varchar(4096),
   years_of_experience                 integer,
   slug                                varchar(45),
   on_site_estimate_policy             varchar(4096),
   payment_policy                      varchar(4096),
   email_preference                    boolean          NOT NULL,
   created_at                          timestamp        NOT NULL,
   updated_at                          timestamp        NOT NULL,
   show_provider                       boolean,
   experience_start_year               integer,
   other_notification_emails           varchar(4096),
   service_provider_uuid               varchar(40),
   min_project_price                   numeric(10),
   onboard_status                      varchar(50),
   minimum_minutes                     integer,
   verified                            boolean,
   temp_photo_url                      varchar(2000),
   temp_logo_url                       varchar(2000),
   old_photo_url                       varchar(2000),
   old_logo_url                        varchar(2000),
   schedule_buffer_days                integer,
   offline_contract_issued             boolean,
   latest_contract_id                  varchar(38),
   latest_contract_status              varchar(38),
   force_reset_password                boolean,
   bond_amount                         numeric(11,2),
   bond_expiry_date                    timestamp,
   insurance_expiry_date               timestamp
);

ALTER TABLE service_providers
   ADD CONSTRAINT service_providers_pkey
   PRIMARY KEY (service_provider_id);

CREATE INDEX service_providers_primary_trade_id_idx ON service_providers USING btree (primary_trade_id);

COMMIT;
