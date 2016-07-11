DROP TABLE IF EXISTS mpo_zip_bnd CASCADE;

CREATE TABLE mpo_zip_bnd
(
   zip         varchar(5)     NOT NULL,
   name        varchar(40),
   ziptype     varchar(20)    NOT NULL,
   state       varchar(2)     NOT NULL,
   statefips   varchar(2)     NOT NULL,
   countyfips  varchar(5)     NOT NULL,
   countyname  varchar(60)    NOT NULL,
   s3dzip      varchar(3)     NOT NULL,
   lat         float8         NOT NULL,
   lon         float8         NOT NULL,
   emptycol    varchar(5),
   totrescnt   integer        NOT NULL,
   mfdu        integer        NOT NULL,
   sfdu        integer        NOT NULL,
   boxcnt      integer        NOT NULL,
   bizcnt      integer        NOT NULL,
   relver      varchar(8)     NOT NULL
);

COMMIT;
