DROP TABLE IF EXISTS lb_att_evt CASCADE;

CREATE TABLE lb_att_evt
(
   attribution_event_id   varchar(40)     DEFAULT ''::character varying NOT NULL,
   attribution_record_id  varchar(40)     NOT NULL,
   event_type             varchar(40)     NOT NULL,
   customer_id            varchar(40),
   magic_list_id          varchar(40),
   service_request_id     varchar(40),
   custom_event_string    varchar(100),
   created_at             timestamp       DEFAULT ('now'::text)::timestamp(6) with time zone,
   order_id               varchar(40)
);

ALTER TABLE lb_att_evt
   ADD CONSTRAINT lb_att_evt_pkey
   PRIMARY KEY (attribution_event_id);

CREATE INDEX lb_att_evt_attribution_event_id_idx ON lb_att_evt USING btree (attribution_event_id);
CREATE INDEX lb_att_evt_attribution_record_id_idx ON lb_att_evt USING btree (attribution_record_id);
CREATE INDEX lb_att_evt_event_type_idx ON lb_att_evt USING btree (event_type);
CREATE INDEX lb_att_evt_customer_id_idx ON lb_att_evt USING btree (customer_id);
CREATE INDEX lb_att_evt_magic_list_id_idx ON lb_att_evt USING btree (magic_list_id);
CREATE INDEX lb_att_evt_service_request_id_idx ON lb_att_evt USING btree (service_request_id);
CREATE INDEX lb_att_evt_order_id_idx ON lb_att_evt USING btree (order_id);

COMMIT;
