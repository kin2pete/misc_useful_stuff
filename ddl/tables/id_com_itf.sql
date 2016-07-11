DROP TABLE IF EXISTS id_com_itf CASCADE;

CREATE TABLE id_com_itf
(
   communication_interface_id  varchar(40)      NOT NULL,
   type                        varchar(40)      NOT NULL,
   external_id                 varchar(4096),
   user_id                     varchar(40)      NOT NULL,
   is_active                   boolean,
   arn                         varchar(180),
   created_time                timestamp,
   updated_time                timestamp
);

ALTER TABLE id_com_itf
   ADD CONSTRAINT id_com_itf_pkey
   PRIMARY KEY (communication_interface_id);
   
CREATE INDEX id_com_itf_external_id_idx ON id_com_itf USING btree (external_id);
CREATE INDEX id_com_itf_user_id_idx ON id_com_itf USING btree (user_id);
CREATE INDEX id_com_itf_arn_idx ON id_com_itf USING btree (arn);

COMMIT;
