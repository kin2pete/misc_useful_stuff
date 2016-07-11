DROP TABLE IF EXISTS bb_prv_sch CASCADE;

CREATE TABLE bb_prv_sch
(
   id                   varchar(40)    NOT NULL,
   provider_id          varchar(40)    NOT NULL,
   start_time           timestamp      NOT NULL,
   end_time             timestamp      NOT NULL,
   buffered_start_time  timestamp      NOT NULL,
   buffered_end_time    timestamp      NOT NULL,
   booking_type         varchar(40),
   created_by           varchar(40),
   updated_by           varchar(40),
   created_time         timestamp      DEFAULT ('now'::text)::timestamp(6) with time zone,
   updated_time         timestamp      DEFAULT ('now'::text)::timestamp(6) with time zone,
   service_request_id   varchar(40),
   status               varchar(32)    DEFAULT 'ACTIVE'::character varying NOT NULL,
   order_id             varchar(64),
   pro_type             varchar(64),
   timestamp_range	 tsrange 	  DEFAULT NULL,
   buffered_timestamp_range	 tsrange 	  DEFAULT NULL
);

ALTER TABLE bb_prv_sch
   ADD CONSTRAINT bb_prv_sch_pkey
   PRIMARY KEY (id);
   
CREATE INDEX bb_prv_sch_provider_id_idx ON bb_prv_sch USING btree (provider_id);
CREATE INDEX bb_prv_sch_service_request_id_idx ON bb_prv_sch USING btree (service_request_id);
CREATE INDEX bb_prv_sch_order_id_idx ON bb_prv_sch USING btree (order_id);
CREATE INDEX bb_prv_sch_timestamp_range_idx ON bb_prv_sch USING gist (timestamp_range);
CREATE INDEX bb_prv_sch_buffered_timestamp_range_idx ON bb_prv_sch USING gist (buffered_timestamp_range);

COMMIT;
