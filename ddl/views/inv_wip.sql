CREATE OR REPLACE VIEW inv_wip
(
  order_id,
  order_date,
  channel,
  prov_id,
  prov_name,
  cust_name,
  service_date,
  svc_retail,
  cust_inv_id,
  cust_inv_amt,
  our_rev_earned,
  our_exp_owed,
  our_inv_sent,
  our_inv_id,
  our_inv_date,
  our_inv_amt
)
AS 
 SELECT rpt.order_id, rpt.order_date, rpt.channel, rpt.prov_id, rpt.prov_name, rpt.cust_name, rpt.service_date, inv.svc_retail, inv.cust_inv_id, inv.cust_inv_amt, inv.our_rev_earned, inv.our_exp_owed, inv.our_inv_sent, inv.our_inv_id, inv.our_inv_date, inv.our_inv_amt
   FROM ( SELECT jobs_manual.id AS order_id,  jobs_manual.created_on AT TIME ZONE 'PST' AS order_date, jobs_manual.channel, NULL::character varying AS prov_id, jobs_manual.provider AS prov_name, jobs_manual.customer AS cust_name, jobs_manual.schedule_start AT TIME ZONE 'PST' AS service_date
           FROM jobs_manual
          WHERE jobs_manual.status::text = 'COMPLETED'::text
UNION 
         SELECT o.customer_order_id AS order_id,  o.booked_time AT TIME ZONE 'PST' AS order_date, o.channel, o.service_provider_id AS prov_id, p.service_provider_name AS prov_name, ((c.last_name::text || ', '::text) || c.first_name::text)::character varying AS cust_name, o.service_start_time AT TIME ZONE 'PST' AS service_date
           FROM os_cst_ord o
      LEFT JOIN ci_cst c ON c.id::text = o.customer_id::text
   LEFT JOIN service_providers p ON p.service_provider_id::text = o.service_provider_id::text
  WHERE o.order_status::text = 'COMPLETED'::text) rpt
   LEFT JOIN ord_inv_amt inv ON inv.order_id::text = rpt.order_id::text
  ORDER BY rpt.order_date DESC;


--GRANT SELECT ON inv_wip TO report;


COMMIT;
