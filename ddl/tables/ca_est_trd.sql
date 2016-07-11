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

ALTER TABLE ca_est_trd
   ADD CONSTRAINT ca_est_trd_pkey
   PRIMARY KEY (estimate_trade_id);
   
CREATE INDEX ca_est_trd_estimate_id_idx ON ca_est_trd USING btree (estimate_id);
CREATE INDEX ca_est_trd_trade_id_idx ON ca_est_trd USING btree (trade_id);


COMMIT;
