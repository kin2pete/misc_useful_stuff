DROP TABLE IF EXISTS msg_com_otb CASCADE;

CREATE TABLE msg_com_otb
(
   communication_outbound_id   varchar(40)      NOT NULL,
   communication_id            varchar(40)      NOT NULL,
   communication_recipient_id  varchar(40)      NOT NULL,
   communication_interface_id  varchar(40)      NOT NULL,
   status                      varchar(45),
   external_status             varchar(45),
   confirmation_id             varchar(60),
   sent_date                   timestamp,
   seen_date                   timestamp,
   payload                     varchar(4096),
   duration                    integer
);

ALTER TABLE msg_com_otb
   ADD CONSTRAINT msg_com_otb_pkey
   PRIMARY KEY (communication_outbound_id);

CREATE INDEX msg_com_otb_communication_outbound_id_idx ON msg_com_otb USING btree (communication_outbound_id);
CREATE INDEX msg_com_otb_communication_id_idx ON msg_com_otb USING btree (communication_id);
CREATE INDEX msg_com_otb_communication_recipient_id_idx ON msg_com_otb USING btree (communication_recipient_id);
CREATE INDEX msg_com_otb_communication_interface_id_idx ON msg_com_otb USING btree (communication_interface_id);

COMMIT;
