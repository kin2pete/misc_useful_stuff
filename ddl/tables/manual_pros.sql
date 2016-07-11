DROP TABLE IF EXISTS manual_pros CASCADE;

CREATE TABLE manual_pros
(
   rep_name            varchar(40)     NOT NULL,
   pro_name            varchar(128)    NOT NULL,
   primary_discipline  varchar(60)     NOT NULL,
   city                varchar(40)     NOT NULL,
   state               varchar(2)      NOT NULL,
   zip_code            integer
);

COMMIT;
