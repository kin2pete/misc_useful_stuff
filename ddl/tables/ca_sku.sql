DROP TABLE IF EXISTS ca_sku CASCADE;

CREATE TABLE ca_sku
(
   sku_id                          varchar(36)      NOT NULL,
   service_name                    varchar(255)     NOT NULL,
   display_name                    varchar(255)     NOT NULL,
   sku_type                        varchar(255)     NOT NULL,
   nominal_description             varchar(4096),
   work_state                      varchar(255),
   priority                        integer,
   complexity                      integer,
   needs_photo                     boolean,
   photo_notes                     varchar(4096),
   needs_video                     boolean,
   video_notes                     varchar(4096),
   initial_estimate_id             varchar(36),
   initial_qualifying_question_id  varchar(36),
   deleted                         boolean          NOT NULL,
   created_at                      timestamp        NOT NULL,
   updated_at                      timestamp        NOT NULL
);


ALTER TABLE ca_sku
   ADD CONSTRAINT ca_sku_pkey
   PRIMARY KEY (sku_id);
   
CREATE INDEX ca_sku_initial_estimate_id_idx ON ca_sku USING btree (initial_estimate_id);
CREATE INDEX ca_sku_sku_type_idx ON ca_sku USING btree (sku_type);

COMMIT;
