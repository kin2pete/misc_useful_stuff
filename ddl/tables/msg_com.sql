DROP TABLE IF EXISTS msg_com CASCADE;

CREATE TABLE msg_com
(
   communication_id                   varchar(40)      NOT NULL,
   conversation_id                    varchar(40),
   hidden_from_conversation           boolean,
   type                               varchar(40)      NOT NULL,
   subject                            varchar(4096),
   body                               varchar(4096),
   from_user_id                       varchar(40),
   from_communication_interface_type  varchar(40),
   from_communication_interface_id    varchar(40),
   sent_date                          timestamp
);

ALTER TABLE msg_com
   ADD CONSTRAINT msg_com_pkey
   PRIMARY KEY (communication_id);

CREATE INDEX msg_com_communication_id_idx ON msg_com USING btree (communication_id);
CREATE INDEX msg_com_conversation_id_idx ON msg_com USING btree (conversation_id);
CREATE INDEX msg_com_from_user_id_idx ON msg_com USING btree (from_user_id);
CREATE INDEX msg_com_from_communication_interface_id_idx ON msg_com USING btree (from_communication_interface_id);

COMMIT;
