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

COMMIT;
