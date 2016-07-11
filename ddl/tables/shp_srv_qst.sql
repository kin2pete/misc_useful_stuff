DROP TABLE IF EXISTS shp_srv_qst CASCADE;

CREATE TABLE shp_srv_qst
(
   question_id                integer          NOT NULL,
   question_text              varchar(4096)    NOT NULL,
   question_type              varchar(64)      NOT NULL,
   response_aggregation_type  varchar(64)      NOT NULL,
   is_provider_feedback       boolean          NOT NULL,
   question_section_id        integer,
   semantic_tag               varchar(64)      NOT NULL
);

COMMIT;
