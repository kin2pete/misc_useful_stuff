DROP TABLE IF EXISTS mpo_nhd_zip CASCADE;

CREATE TABLE mpo_nhd_zip
(
   nid                  integer         NOT NULL,
   neighborhood         varchar(100)    NOT NULL,
   zip_code             varchar(5)      NOT NULL,
   postal_name          varchar(60)     NOT NULL,
   state                varchar(2)      NOT NULL,
   zip_type             varchar(20)     NOT NULL,
   zippercent           float8          NOT NULL,
   totrescnt            integer         NOT NULL,
   mfdu                 integer,
   sfdu                 integer         NOT NULL,
   boxcnt               integer         NOT NULL,
   bizcnt               integer         NOT NULL,
   neighborhoodrelease  varchar(10)     NOT NULL,
   zipcoderelease       varchar(10)     NOT NULL,
   ntype                varchar(1)      NOT NULL
);

COMMIT;
