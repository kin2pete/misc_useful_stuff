DROP TABLE IF EXISTS ca_est_trd CASCADE;

CREATE TABLE ca_est_trd
(
   estimate_trade_id  integer         NOT NULL,
   estimate_id        varchar(36)     NOT NULL,
   trade_id           integer,
   display_order      integer         NOT NULL,
   created_at         timestamp       NOT NULL,
   updated_at         timestamp       NOT NULL,
   percentage         numeric(5,2)    NOT NULL,
   deleted            boolean         NOT NULL
);

COMMIT;
