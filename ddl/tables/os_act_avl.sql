DROP TABLE IF EXISTS os_act_avl CASCADE;

CREATE TABLE os_act_avl
(
   actor_availability_id      varchar(40)    NOT NULL,
   actor_type                 varchar(64)    NOT NULL,
   actor_id                   varchar(40)    NOT NULL,
   partial_order_id           varchar(40)    NOT NULL,
   service_start_time         timestamp      NOT NULL,
   service_start_time_in_iso  varchar(40)    NOT NULL,
   service_end_time           timestamp      NOT NULL,
   service_end_time_in_iso    varchar(40)    NOT NULL,
   created_time               timestamp,
   updated_time               timestamp,
   availability_status        varchar(64)    NOT NULL,
   locked_assignment_id       varchar(40),
   is_default                 boolean        DEFAULT false NOT NULL
);

COMMIT;
