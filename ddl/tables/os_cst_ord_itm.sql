DROP TABLE IF EXISTS os_cst_ord_itm CASCADE;

CREATE TABLE os_cst_ord_itm
(
   customer_order_line_item_id  varchar(40)      NOT NULL,
   customer_order_id            varchar(40)      NOT NULL,
   magic_list_item_id           varchar(40)      NOT NULL,
   service_min_price            numeric(11,2),
   service_max_price            numeric(11,2),
   service_actual_price         numeric(11,2),
   service_sku_id               varchar(40)      NOT NULL,
   created_time                 timestamp,
   updated_time                 timestamp,
   answer_id                    varchar(40)
);

COMMIT;
