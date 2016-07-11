DROP TABLE IF EXISTS shp_srv_qst_opt CASCADE;

CREATE TABLE shp_srv_qst_opt
(
   question_option_id  integer         NOT NULL,
   question_id         integer         NOT NULL,
   option_text         varchar(64)     NOT NULL,
   display_order       integer         NOT NULL,
   is_active           boolean         NOT NULL,
   value               integer,
   option_value        integer,
   tag                 varchar(255),
   is_no_selection     boolean         NOT NULL,
   additional_info     varchar(256)
);

COMMIT;
