DROP TABLE IF EXISTS shp_srv_qst_sec CASCADE;

CREATE TABLE shp_srv_qst_sec
(
   question_section_id     integer          NOT NULL,
   section_name            varchar(4096)    NOT NULL,
   section_name_for_email  varchar(4096)
);

COMMIT;
