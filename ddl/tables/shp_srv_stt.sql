DROP TABLE IF EXISTS shp_srv_stt CASCADE;

CREATE TABLE shp_srv_stt
(
   survey_stat_id        integer          NOT NULL,
   created_at            timestamp        NOT NULL,
   service_provider_id   integer          NOT NULL,
   participation_id      integer,
   stat_value            numeric(20,5)    NOT NULL,
   customer_count        integer          NOT NULL,
   option_tag            varchar(128),
   counter_option_value  numeric(11,2)
);

COMMIT;
