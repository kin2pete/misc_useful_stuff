DROP TABLE IF EXISTS ord_tgt_mth CASCADE;

CREATE TABLE ord_tgt_mth
(
   year   integer    NOT NULL,
   month  integer    NOT NULL,
   gross  integer,
   net    integer
);

COMMIT;
