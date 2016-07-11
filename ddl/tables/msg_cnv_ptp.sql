DROP TABLE IF EXISTS msg_cnv_ptp CASCADE;

CREATE TABLE msg_cnv_ptp
(
   conversation_participant_id  varchar(40)    NOT NULL,
   conversation_id              varchar(40)    NOT NULL,
   user_id                      varchar(40)    NOT NULL,
   created_date                 timestamp
);


CREATE INDEX msg_cnv_ptp_conversation_id_idx ON msg_cnv_ptp USING btree (conversation_id);
CREATE INDEX msg_cnv_ptp_user_id_idx ON msg_cnv_ptp USING btree (user_id);

COMMIT;
