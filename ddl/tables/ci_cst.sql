DROP TABLE IF EXISTS ci_cst CASCADE;

CREATE TABLE ci_cst
(
   id                       varchar(38)     NOT NULL,
   first_name               varchar(64),
   last_name                varchar(64),
   phone_number             varchar(16),
   notification_preference  boolean         NOT NULL,
   password_digest          varchar(64),
   deleted_status           varchar(32),
   account_status           varchar(32),
   created_at               timestamp,
   updated_at               timestamp,
   initial_session_id       varchar(40),
   email_address            varchar(128)
);

ALTER TABLE ci_cst
   ADD CONSTRAINT ci_cst_pkey
   PRIMARY KEY (id);
   
CREATE INDEX ci_cst_first_name_idx ON ci_cst USING btree (first_name);
CREATE INDEX ci_cst_last_name_idx ON ci_cst USING btree (last_name);


COMMIT;
