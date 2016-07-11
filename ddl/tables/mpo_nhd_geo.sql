DROP TABLE IF EXISTS mpo_nhd_geo CASCADE;

CREATE TABLE mpo_nhd_geo
(
   nid         integer         NOT NULL,
   cbsa        varchar(100)    NOT NULL,
   cbsacode    varchar(5)      NOT NULL,
   cbsatype    varchar(5)      NOT NULL,
   state       varchar(2)      NOT NULL,
   statefips   varchar(2)      NOT NULL,
   county      varchar(100)    NOT NULL,
   countyfips  varchar(5)      NOT NULL,
   mcd         varchar(100),
   cousubfp    varchar(5)      NOT NULL,
   place       varchar(100),
   plcidfp     varchar(7)
);

COMMIT;
