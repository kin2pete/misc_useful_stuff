DROP TABLE IF EXISTS msg_gtw_rte CASCADE;

CREATE TABLE msg_gtw_rte
(
   gateway_routing_id             varchar(40)    NOT NULL,
   user_id                        varchar(40)    NOT NULL,
   destination_user_id            varchar(40)    NOT NULL,
   destination_gateway_number_id  varchar(40)    NOT NULL,
   created_time                   timestamp,
   updated_time                   timestamp
);

ALTER TABLE msg_gtw_rte
   ADD CONSTRAINT msg_gtw_rte_pkey
   PRIMARY KEY (gateway_routing_id);

CREATE INDEX msg_gtw_rte_user_id_idx ON msg_gtw_rte USING btree (user_id);
CREATE INDEX msg_gtw_rte_destination_user_id_idx ON msg_gtw_rte USING btree (destination_user_id);
CREATE INDEX msg_gtw_rte_destination_gateway_number_id_idx ON msg_gtw_rte USING btree (destination_gateway_number_id);

COMMIT;
