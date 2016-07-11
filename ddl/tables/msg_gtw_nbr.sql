DROP TABLE IF EXISTS msg_gtw_nbr CASCADE;

CREATE TABLE msg_gtw_nbr
(
   gateway_number_id  varchar(40)    NOT NULL,
   number             varchar(20)    NOT NULL,
   sid                varchar(45)    NOT NULL,
   assigned_user_id   varchar(40),
   is_active          boolean,
   created_time       timestamp,
   updated_time       timestamp,
   last_used_time     timestamp
);

ALTER TABLE msg_gtw_nbr
   ADD CONSTRAINT msg_gtw_nbr_pkey
   PRIMARY KEY (gateway_number_id);

CREATE INDEX msg_gtw_nbr_number_idx ON msg_gtw_nbr USING btree (number);
CREATE INDEX msg_gtw_nbr_sid_idx ON msg_gtw_nbr USING btree (sid);
CREATE INDEX msg_gtw_nbr_assigned_user_id_idx ON msg_gtw_nbr USING btree (assigned_user_id);

COMMIT;
