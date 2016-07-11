DROP TABLE IF EXISTS wa_sos_ubi CASCADE;

CREATE TABLE wa_sos_ubi
(
   ubi          varchar(9)      NOT NULL,
   name         varchar(120),
   category     varchar(3),
   inc_state    varchar(2),
   inc_date     date,
   exp_date     date,
   duration     varchar(20),
   dis_date     date,
   status       varchar(20)     NOT NULL,
   type         varchar(10)     NOT NULL,
   agent_name   varchar(60),
   agent_addr   varchar(120),
   agent_city   varchar(20),
   agent_state  varchar(10),
   agent_zip    varchar(30),
   alt_addr     varchar(120),
   alt_city     varchar(20),
   alt_state    varchar(10),
   alt_zip      varchar(30)
);

COMMIT;
