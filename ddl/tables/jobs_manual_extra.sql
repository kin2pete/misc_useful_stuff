DROP TABLE IF EXISTS jobs_manual_extra CASCADE;

CREATE TABLE jobs_manual_extra
(
   id              varchar(64)     NOT NULL,
   created_on      timestamp       NOT NULL,
   customer        varchar(128),
   phone           varchar(32),
   email           varchar(128),
   address         varchar(256),
   service         varchar(64),
   provider        varchar(128),
   schedule_start  timestamp,
   in_cooper       boolean         NOT NULL
);

COMMIT;
