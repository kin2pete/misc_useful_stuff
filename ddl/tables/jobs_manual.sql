DROP TABLE IF EXISTS jobs_manual CASCADE;

CREATE TABLE jobs_manual
(
   id                      varchar(64)      NOT NULL,
   created_on              timestamp,
   is_internal_or_testing  boolean          NOT NULL,
   is_estimate             boolean          NOT NULL,
   is_referral             boolean          NOT NULL,
   is_easy_list            boolean          NOT NULL,
   channel                 varchar(40),
   campaign_src            varchar(40),
   coupon                  varchar(40),
   campaign                varchar(40),
   deal_type               varchar(40),
   service                 varchar(128),
   notes                   varchar(200),
   price                   numeric(10,2),
   provider                varchar(128),
   is_signed_prov          boolean,
   customer                varchar(128),
   status                  varchar(40)      NOT NULL,
   is_completed            boolean          NOT NULL,
   is_rescheduled          boolean          NOT NULL,
   rescheduled_reason      varchar(128),
   schedule_start          timestamp,
   is_survey_req           boolean          NOT NULL,
   is_survey_rec           boolean          NOT NULL,
   zip_code                varchar(10),
   ext_reason              varchar(30),
   gesv                    numeric(11,2)
);

COMMIT;
