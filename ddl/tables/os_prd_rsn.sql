DROP TABLE IF EXISTS os_prd_rsn CASCADE;

CREATE TABLE os_prd_rsn
(
   id             varchar(40)      NOT NULL,
   order_status   varchar(40)      NOT NULL,
   detail         varchar(4096)    NOT NULL,
   display_order  integer          NOT NULL,
   should_show    boolean          NOT NULL,
   is_custom      boolean
);

COMMIT;
