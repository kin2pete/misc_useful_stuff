DROP TABLE IF EXISTS mi_zip_city CASCADE;

CREATE TABLE mi_zip_city
(
   zip_code    integer        NOT NULL,
   kind        varchar(4)     NOT NULL,
   code        varchar(64)    NOT NULL,
   zip_count   integer        NOT NULL,
   state_abbr  varchar(2)     NOT NULL,
   city_name   varchar(64)    NOT NULL
);

COMMIT;
