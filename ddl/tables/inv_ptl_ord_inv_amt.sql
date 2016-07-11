DROP TABLE IF EXISTS inv_ptl_ord_inv_amt CASCADE;

CREATE TABLE inv_ptl_ord_inv_amt
(
   partial_order_id   varchar(40)      NOT NULL,
   customer_order_id  varchar(40)      NOT NULL,
   bill_id            varchar(40)      NOT NULL,
   invoice_amount     numeric(12,2)
);

   
CREATE INDEX inv_ptl_ord_inv_amt_customer_order_id_idx ON inv_ptl_ord_inv_amt USING btree (customer_order_id);
CREATE INDEX inv_ptl_ord_inv_amt_bill_id_idx ON inv_ptl_ord_inv_amt USING btree (bill_id);
CREATE INDEX inv_ptl_ord_inv_amt_partial_order_id_idx ON inv_ptl_ord_inv_amt USING btree (partial_order_id);

COMMIT;
