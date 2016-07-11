DROP TABLE IF EXISTS os_srv_trk CASCADE;

CREATE TABLE os_srv_trk
(
   id                            varchar(40)    NOT NULL,
   service_provider_customer_id  varchar(40)    NOT NULL,
   survey_sent_time              timestamp      NOT NULL,
   survey_participation_id       varchar(40)    NOT NULL,
   service_provider_id           varchar(40)    NOT NULL,
   customer_order_id             varchar(40)    NOT NULL
);

COMMIT;
