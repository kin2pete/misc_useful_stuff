DROP TABLE IF EXISTS msg_cnv CASCADE;

CREATE TABLE msg_cnv
(
   conversation_id  varchar(40)    NOT NULL,
   topic_id         varchar(90),
   created_date     timestamp
);

CREATE INDEX msg_cnv_conversation_id_idx ON msg_cnv USING btree (conversation_id);
CREATE INDEX msg_cnv_topic_id_idx ON msg_cnv USING btree (topic_id);

COMMIT;
