DROP TABLE IF EXISTS dsk_cst CASCADE;

CREATE TABLE dsk_cst
(
   id                     integer          NOT NULL,
   first_name             varchar(120),
   last_name              varchar(120),
   company                varchar(120),
   title                  varchar(120),
   avatar                 varchar(120),
   uid                    varchar(40),
   external_id            varchar(40),
   background             varchar(1000),
   language               varchar(10),
   locked_until           timestamp,
   created_at             timestamp        NOT NULL,
   updated_at             timestamp        NOT NULL,
   is_partner             boolean,
   is_service_provider    boolean,
   is_friends             boolean,
   is_promoter            boolean,
   pdc_customer_id        varchar(40),
   persona                varchar(40),
   real_address           varchar(200),
   real_email             varchar(200),
   shp_customer_id        varchar(120),
   white_glove            boolean,
   access_private_portal  boolean          NOT NULL,
   access_company_cases   boolean          NOT NULL
);

COMMIT;
