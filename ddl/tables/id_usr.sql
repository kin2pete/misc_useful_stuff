DROP TABLE IF EXISTS id_usr CASCADE;

CREATE TABLE id_usr
(
   user_id           varchar(40)      NOT NULL,
   type              varchar(40),
   first_name        varchar(135),
   last_name         varchar(135),
   display_name      varchar(135),
   avatar_image_url  varchar(1024),
   is_active         boolean,
   created_time      timestamp,
   updated_time      timestamp
);

ALTER TABLE id_usr
   ADD CONSTRAINT id_usr_pkey
   PRIMARY KEY (user_id);
   
CREATE INDEX id_usr_display_name_idx ON id_usr USING btree (display_name);
CREATE INDEX id_usr_first_name_idx ON id_usr USING btree (first_name);
CREATE INDEX id_usr_last_name_idx ON id_usr USING btree (last_name);

COMMIT;
