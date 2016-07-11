DROP TABLE IF EXISTS shp_srv_ptp CASCADE;

CREATE TABLE shp_srv_ptp
(
   survey_participation_id             integer          NOT NULL,
   service_provider_customer_id        integer          NOT NULL,
   surveyance_id                       integer          NOT NULL,
   created_time                        timestamp        NOT NULL,
   call_request                        boolean,
   negative_feedback                   boolean,
   responded_time                      timestamp,
   notes                               varchar(4096),
   last_viewed_by_service_provider_at  timestamp,
   is_cancelled                        boolean          NOT NULL,
   summary                             varchar(4096),
   resent_time                         timestamp,
   response_feedback_type              varchar(32),
   is_closed                           boolean          NOT NULL,
   overall_rating                      numeric(11,2),
   service_date                        date,
   shareable                           boolean,
   is_sample_survey                    boolean          NOT NULL
);

COMMIT;
