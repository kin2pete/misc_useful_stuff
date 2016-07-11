CREATE OR REPLACE VIEW ord_eow_sts
(
  year,
  month,
  day,
  booked,
  confirmed,
  rescheduled,
  completed,
  rejected,
  cancelled,
  other,
  open,
  net,
  failed,
  gross
)
AS 
 SELECT rpt."year", rpt."month", rpt."day", sum(rpt.booked) AS booked, sum(rpt.confirmed) AS confirmed, sum(rpt.rescheduled) AS rescheduled, sum(rpt.completed) AS completed, sum(rpt.rejected) AS rejected, sum(rpt.cancelled) AS cancelled, sum(rpt.other) AS other, sum(rpt.booked + rpt.confirmed + rpt.rescheduled) AS "open", sum(rpt.booked + rpt.confirmed + rpt.rescheduled + rpt.completed) AS net, sum(rpt.rejected + rpt.cancelled) AS failed, sum(rpt.booked + rpt.confirmed + rpt.rescheduled + rpt.completed + rpt.rejected + rpt.cancelled + rpt.other) AS gross
   FROM ( SELECT map."year", map."month", map."day", sum(map.booked) AS booked, sum(map.confirmed) AS confirmed, sum(map.cancelled) AS cancelled, sum(map.completed) AS completed, sum(map.rejected) AS rejected, sum(map.rescheduled) AS rescheduled, sum(map.other) AS other
           FROM ( SELECT "date_part"('year'::text, ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "year", "date_part"('month'::text, ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "month", "date_part"('day'::text, ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "day", cvt.booked, cvt.confirmed, cvt.cancelled, cvt.completed, cvt.rejected, cvt.rescheduled, cvt.other
                   FROM ( SELECT os_cst_ord.booked_time AT TIME ZONE 'PST' AS created_at, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'BOOKED'::text THEN 1
                                    ELSE 0
                                END AS booked, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'CONFIRMED'::text THEN 1
                                    ELSE 0
                                END AS confirmed, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'CANCELLED'::text THEN 1
                                    ELSE 0
                                END AS cancelled, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'COMPLETED'::text THEN 1
                                    ELSE 0
                                END AS completed, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'REJECTED'::text THEN 1
                                    ELSE 0
                                END AS rejected, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'RESCHEDULED'::text THEN 1
                                    ELSE 0
                                END AS rescheduled, 
                                CASE
                                    WHEN os_cst_ord.order_status::text = 'BOOKED'::text OR os_cst_ord.order_status::text = 'CONFIRMED'::text OR os_cst_ord.order_status::text = 'CANCELLED'::text OR os_cst_ord.order_status::text = 'COMPLETED'::text OR os_cst_ord.order_status::text = 'REJECTED'::text OR os_cst_ord.order_status::text = 'RESCHEDULED'::text THEN 0
                                    ELSE 1
                                END AS other
                           FROM os_cst_ord) cvt) map
          GROUP BY map."year", map."month", map."day"
UNION 
         SELECT map."year", map."month", map."day", sum(map.booked) AS booked, sum(map.confirmed) AS confirmed, sum(map.cancelled) AS cancelled, sum(map.completed) AS completed, sum(map.rejected) AS rejected, sum(map.rescheduled) AS rescheduled, sum(map.other) AS other
           FROM ( SELECT "date_part"('year'::text, ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "year", "date_part"('month'::text,  ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "month", "date_part"('day'::text, ((6 - "date_part"('dayofweek'::text, cvt.created_at))::integer + cvt.created_at::date)) AS "day", cvt.booked, cvt.confirmed, cvt.cancelled, cvt.completed, cvt.rejected, cvt.rescheduled, cvt.other
                   FROM ( SELECT jobs_manual.created_on AT TIME ZONE 'PST' AS created_at, 
                                CASE
                                    WHEN jobs_manual.status::text = 'BOOKED'::text THEN 1
                                    ELSE 0
                                END AS booked, 
                                CASE
                                    WHEN jobs_manual.status::text = 'CONFIRMED'::text THEN 1
                                    ELSE 0
                                END AS confirmed, 
                                CASE
                                    WHEN jobs_manual.status::text = 'CANCELLED'::text THEN 1
                                    ELSE 0
                                END AS cancelled, 
                                CASE
                                    WHEN jobs_manual.status::text = 'COMPLETED'::text THEN 1
                                    ELSE 0
                                END AS completed, 
                                CASE
                                    WHEN jobs_manual.status::text = 'REJECTED'::text THEN 1
                                    ELSE 0
                                END AS rejected, 
                                CASE
                                    WHEN jobs_manual.status::text = 'RESCHEDULED'::text THEN 1
                                    ELSE 0
                                END AS rescheduled, 
                                CASE
                                    WHEN jobs_manual.status::text = 'BOOKED'::text OR jobs_manual.status::text = 'CONFIRMED'::text OR jobs_manual.status::text = 'CANCELLED'::text OR jobs_manual.status::text = 'COMPLETED'::text OR jobs_manual.status::text = 'REJECTED'::text OR jobs_manual.status::text = 'RESCHEDULED'::text THEN 0
                                    ELSE 1
                                END AS other
                           FROM jobs_manual) cvt) map
          GROUP BY map."year", map."month", map."day") rpt
  GROUP BY rpt."year", rpt."month", rpt."day"
  ORDER BY rpt."year" DESC, rpt."month" DESC, rpt."day" DESC;


GRANT SELECT ON ord_eow_sts TO report;


COMMIT;
