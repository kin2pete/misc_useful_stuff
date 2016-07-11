DROP TABLE IF EXISTS os_ptl_ord_hst CASCADE;

CREATE TABLE os_ptl_ord_hst
(
   partial_order_history_id  varchar(40)      NOT NULL,
   partial_order_id          varchar(40)      NOT NULL,
   customer_order_id         varchar(40),
   event_type                varchar(256),
   event_object_name         varchar(256),
   event_object_id           varchar(256),
   event_detail              varchar(4096),
   created_time              timestamp,
   updated_time              timestamp,
   action_taker_id           varchar(50),
   action_taker_type         varchar(50),
   action_taker_comment      varchar(4096),
   external_event_name       varchar(256),
   internal_event_name       varchar(256)
);

CREATE INDEX os_ptl_ord_hst_partial_order_id_idx ON os_ptl_ord_hst USING btree (partial_order_id);
CREATE INDEX os_ptl_ord_hst_customer_order_id_idx ON os_ptl_ord_hst USING btree (customer_order_id);

COMMIT;
