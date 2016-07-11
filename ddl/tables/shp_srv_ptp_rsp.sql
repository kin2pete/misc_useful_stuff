DROP TABLE IF EXISTS shp_srv_ptp_rsp CASCADE;

CREATE TABLE shp_srv_ptp_rsp
(
   survey_response_id       integer          NOT NULL,
   survey_participation_id  integer          NOT NULL,
   question_id              integer          NOT NULL,
   question_option_id       integer,
   text_response            varchar(4096),
   created_time             timestamp        NOT NULL
);

COMMIT;
