DROP TABLE IF EXISTS msg_com_rcp CASCADE;

CREATE TABLE msg_com_rcp
(
   communication_recipient_id  varchar(40)    NOT NULL,
   communication_id            varchar(40)    NOT NULL,
   user_id                     varchar(40)    NOT NULL,
   seen_on_date                timestamp
);


CREATE INDEX msg_com_rcp_communication_id_idx ON msg_com_rcp USING btree (communication_id);
CREATE INDEX msg_com_rcp_communication_recipient_id_idx ON msg_com_rcp USING btree (communication_recipient_id);
CREATE INDEX msg_com_rcp_user_id_idx ON msg_com_rcp USING btree (user_id);

COMMIT;
