DROP TABLE IF EXISTS mk_mkt_spd CASCADE;

CREATE TABLE mk_mkt_spd
(
   campaign_name  varchar(64)      NOT NULL,
   channel        varchar(64)      NOT NULL,
   day            date             NOT NULL,
   amount         numeric(11,2)    NOT NULL
);

COMMIT;
