DROP TABLE IF EXISTS ca_trd CASCADE;

CREATE TABLE ca_trd
(
   trade_id          integer          NOT NULL,
   trade_name        varchar(255)     NOT NULL,
   description       varchar(4096),
   created_at        timestamp        NOT NULL,
   updated_at        timestamp        NOT NULL,
   role_name         varchar(255)     NOT NULL,
   ml_display_text   varchar(4096)    NOT NULL,
   plural_role_name  varchar(255)     NOT NULL
);

COMMIT;
