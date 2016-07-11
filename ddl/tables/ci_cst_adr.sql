DROP TABLE IF EXISTS ci_cst_adr CASCADE;

CREATE TABLE ci_cst_adr
(
   id           varchar(38)     NOT NULL,
   customer_id  varchar(38)     NOT NULL,
   street       varchar(256),
   city         varchar(32),
   state        varchar(32),
   zipcode      varchar(16),
   is_primary   boolean,
   is_deleted   boolean,
   created_at   timestamp       NOT NULL,
   updated_at   timestamp       NOT NULL
);

ALTER TABLE ci_cst_adr
   ADD CONSTRAINT ci_cst_adr_pkey
   PRIMARY KEY (id);
   
CREATE INDEX ci_cst_adr_customer_id_idx ON ci_cst_adr USING btree (customer_id);
CREATE INDEX ci_cst_adr_zipcode_idx ON ci_cst_adr USING btree (zipcode);
CREATE INDEX ci_cst_adr_city_idx ON ci_cst_adr USING btree (city);
CREATE INDEX ci_cst_adr_state_idx ON ci_cst_adr USING btree (state);

COMMIT;
