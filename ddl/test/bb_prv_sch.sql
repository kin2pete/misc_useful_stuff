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
   pro_type             varchar(64)
);

ALTER TABLE bb_prv_sch
   ADD CONSTRAINT bb_prv_sch_pkey
   PRIMARY KEY (id);

COMMIT;
