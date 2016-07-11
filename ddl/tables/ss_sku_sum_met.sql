DROP TABLE IF EXISTS ss_sku_sum_met CASCADE;

CREATE TABLE ss_sku_sum_met
(
   id                       integer        NOT NULL,
   date                     timestamp      NOT NULL,
   period                   varchar(16)    NOT NULL,
   active_skus              integer,
   inactive_skus            integer,
   activated_skus           integer,
   deactivated_skus         integer,
   indexed_skus             integer,
   new_indexed_skus         integer,
   deindexed_skus           integer,
   active_sku_answers       integer,
   inactive_sku_answers     integer,
   indexed_sku_answers      integer,
   new_indexed_sku_answers  integer,
   deindexed_sku_answers    integer
);

COMMIT;
