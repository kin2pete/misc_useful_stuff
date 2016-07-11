DROP TABLE IF EXISTS shp_srv_srv_qst CASCADE;

CREATE TABLE shp_srv_srv_qst
(
   survey_question_id       integer    NOT NULL,
   survey_id                integer    NOT NULL,
   question_id              integer    NOT NULL,
   display_order            integer    NOT NULL,
   is_active                boolean    NOT NULL,
   display_order_for_email  integer,
   should_show_in_email     boolean    NOT NULL
);

COMMIT;
