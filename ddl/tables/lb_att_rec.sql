DROP TABLE IF EXISTS lb_att_rec CASCADE;

CREATE TABLE lb_att_rec
(
   attribution_record_id        varchar(40)     DEFAULT ''::character varying NOT NULL,
   attribution_channel_id       varchar(40)     NOT NULL,
   attribution_client_type_id   varchar(40),
   attribution_http_request_id  varchar(40),
   session_id                   varchar(40),
   customer_id                  varchar(40),
   channel_entry                varchar(255),
   admin_user                   varchar(255),
   customer_contact_medium      varchar(255),
   created_at                   timestamp       DEFAULT ('now'::text)::timestamp(6) with time zone,
   match_type                   varchar(255),
   match_position               varchar(40)
);

ALTER TABLE lb_att_rec
   ADD CONSTRAINT lb_att_rec_pkey
   PRIMARY KEY (attribution_record_id);

CREATE INDEX lb_att_rec_attribution_record_id_idx ON lb_att_rec USING btree (attribution_record_id);
CREATE INDEX lb_att_rec_attribution_channel_id_idx ON lb_att_rec USING btree (attribution_channel_id);
CREATE INDEX lb_att_rec_attribution_client_type_id_idx ON lb_att_rec USING btree (attribution_client_type_id);
CREATE INDEX lb_att_rec_customer_id_idx ON lb_att_rec USING btree (customer_id);

COMMIT;
