DROP TABLE IF EXISTS shp_srv_rsp_alr CASCADE;

CREATE TABLE shp_srv_rsp_alr
(
   survey_response_alarm_id  integer    NOT NULL,
   service_provider_id       integer    NOT NULL,
   survey_received           boolean    NOT NULL,
   negative_feedback         boolean    NOT NULL,
   callback_requested        boolean    NOT NULL,
   survey_bounced            boolean    NOT NULL,
   email_alert               boolean    NOT NULL,
   text_alert                boolean    NOT NULL
);

COMMIT;
