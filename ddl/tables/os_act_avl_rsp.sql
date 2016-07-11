DROP TABLE IF EXISTS os_act_avl_rsp CASCADE;

CREATE TABLE os_act_avl_rsp
(
   actor_availability_response_id  varchar(40)    NOT NULL,
   partial_order_id                varchar(40)    NOT NULL,
   actor_type                      varchar(64)    NOT NULL,
   actor_id                        varchar(40)    NOT NULL,
   actor_availability_id           varchar(40)    NOT NULL,
   response_type                   varchar(64)    NOT NULL
);

COMMIT;
