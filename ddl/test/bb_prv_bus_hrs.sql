DROP TABLE IF EXISTS bb_prv_bus_hrs CASCADE;

CREATE TABLE bb_prv_bus_hrs
(
   id            varchar(40)    NOT NULL,
   provider_id   varchar(40)    NOT NULL,
   from_date     date           NOT NULL,
   to_date       date           NOT NULL,
   start_time    integer        NOT NULL,
   end_time      integer        NOT NULL,
   created_by    varchar(40)    NOT NULL,
   updated_by    varchar(40),
   created_time  timestamp      DEFAULT ('now'::text)::timestamp(6) with time zone,
   updated_time  timestamp      DEFAULT ('now'::text)::timestamp(6) with time zone
);

ALTER TABLE bb_prv_bus_hrs
   ADD CONSTRAINT bb_prv_bus_hrs_pkey
   PRIMARY KEY (id);

COMMIT;
