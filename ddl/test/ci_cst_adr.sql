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

COMMIT;
