DROP TABLE IF EXISTS msg_com_med CASCADE;

CREATE TABLE msg_com_med
(
   communication_media_id  varchar(40)      NOT NULL,
   communication_id        varchar(40)      NOT NULL,
   status                  varchar(45),
   created_time            timestamp,
   updated_time            timestamp,
   source_url              varchar(1024),
   internal_url            varchar(1024)
);

ALTER TABLE msg_com_med
   ADD CONSTRAINT msg_com_med_pkey
   PRIMARY KEY (communication_media_id);

CREATE INDEX msg_com_med_communication_id_idx ON msg_com_med USING btree (communication_id);

COMMIT;
