DROP TABLE IF EXISTS ord_inv_amt CASCADE;

CREATE TABLE ord_inv_amt
(
   order_id        varchar(40)      NOT NULL,
   order_date      timestamp        NOT NULL,
   channel         varchar(40),
   prov_id         integer,
   prov_name       varchar(256)     NOT NULL,
   cust_name       varchar(256)     NOT NULL,
   service_date    timestamp,
   svc_retail      numeric(11,2),
   cust_inv_id     varchar(40),
   cust_inv_amt    numeric(11,2),
   our_rev_earned  numeric(11,2),
   our_exp_owed    numeric(11,2),
   our_inv_sent    boolean,
   our_inv_id      varchar(40),
   our_inv_date    date,
   our_inv_amt     numeric(11,2),
   oth_rev_amt     numeric(11,2),
   oth_rev_cat     varchar(40),
   our_inv_notes   varchar(4096)
);

COMMIT;
