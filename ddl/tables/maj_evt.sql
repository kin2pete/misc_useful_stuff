DROP TABLE IF EXISTS maj_evt CASCADE;

CREATE TABLE maj_evt
(
   timestamp  timestamp,
   type       varchar(32)      NOT NULL,
   event      varchar(1024)    NOT NULL
);

COMMIT;
