DROP TABLE IF EXISTS mpo_nhd_nam CASCADE;

CREATE TABLE mpo_nhd_nam
(
   nid       integer         NOT NULL,
   lid       varchar(3)      NOT NULL,
   nametype  varchar(51)     NOT NULL,
   name_e    varchar(100)    NOT NULL,
   name_n    varchar(100),
   name_r    varchar(100)
);

COMMIT;
