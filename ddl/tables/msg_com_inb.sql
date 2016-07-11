DROP TABLE IF EXISTS msg_com_inb CASCADE;

CREATE TABLE msg_com_inb
(
   communication_inbound_id  varchar(40)     NOT NULL,
   communication_id          varchar(40)     NOT NULL,
   gateway_number_id         varchar(40),
   confirmation_id           varchar(128),
   created_date              timestamp       NOT NULL
);

ALTER TABLE msg_com_inb
   ADD CONSTRAINT msg_com_inb_pkey
   PRIMARY KEY (communication_inbound_id);

CREATE INDEX msg_com_inb_communication_inbound_id_idx ON msg_com_inb USING btree (communication_inbound_id);
CREATE INDEX msg_com_inb_communication_id_idx ON msg_com_inb USING btree (communication_id);
CREATE INDEX msg_com_inb_gateway_number_id_idx ON msg_com_inb USING btree (gateway_number_id);
CREATE INDEX msg_com_inb_confirmation_id_idx ON msg_com_inb USING btree (confirmation_id);

COMMIT;
