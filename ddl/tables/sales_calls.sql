DROP TABLE IF EXISTS sales_calls CASCADE;

CREATE TABLE sales_calls
(
   day            date           NOT NULL,
   rep            varchar(30)    NOT NULL,
   pro_call       integer        NOT NULL,
   pro_conv       integer        NOT NULL,
   pro_1cc        integer        NOT NULL,
   pro_ctr_out    integer        NOT NULL,
   pro_ctr_in     integer        NOT NULL,
   pro_decline    integer        NOT NULL,
   cust_call      integer        NOT NULL,
   cust_conv      integer        NOT NULL,
   cust_add_pipe  integer        NOT NULL,
   cust_pro_call  integer        NOT NULL,
   cust_matched   integer        NOT NULL
);

COMMIT;
