DROP TABLE IF EXISTS inv_manual CASCADE;

CREATE TABLE inv_manual
(
   id     varchar(64)      NOT NULL,
   price  numeric(10,2)    NOT NULL
);

COMMIT;
