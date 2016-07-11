DROP TABLE IF EXISTS mi_cty_pos CASCADE;

CREATE TABLE mi_cty_pos
(
   cty_pos_code  char(1)        NOT NULL,
   name          varchar(16)    NOT NULL
);

COMMIT;
