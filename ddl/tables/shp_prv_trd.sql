DROP TABLE IF EXISTS shp_prv_trd CASCADE;

CREATE TABLE shp_prv_trd
(
   id              integer      NOT NULL,
   provider_id     integer      NOT NULL,
   trade_id        integer      NOT NULL,
   sub_contracted  boolean      NOT NULL,
   created_at      timestamp    NOT NULL,
   updated_at      timestamp    NOT NULL
);

ALTER TABLE shp_prv_trd
   ADD CONSTRAINT shp_prv_trd_pkey
   PRIMARY KEY (id);

CREATE INDEX shp_prv_trd_provider_id_idx ON shp_prv_trd USING btree (provider_id);
CREATE INDEX shp_prv_trd_trade_id_idx ON shp_prv_trd USING btree (trade_id);

COMMIT;
