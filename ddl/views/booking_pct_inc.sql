CREATE OR REPLACE VIEW booking_pct_inc
(
  as_of,
  last_30,
  prev_30,
  pct_inc
)
AS 
 SELECT rpt.as_of, rpt.last_30, rpt.prev_30, ((rpt.last_30::numeric::numeric(11,2) - rpt.prev_30::numeric::numeric(11,2)) / rpt.prev_30::numeric::numeric(11,2))::numeric(11,2) AS pct_inc
   FROM ( SELECT (SELECT current_date AT TIME ZONE 'PST' AS convert_timezone) AS as_of, 
   ( SELECT count(*) AS count
                   FROM all_booking_times
                  WHERE all_booking_times.booked_time >= (current_date - interval'30 day') AND all_booking_times.booked_time <= current_date) AS last_30, ( SELECT count(*) AS count
                   FROM all_booking_times
                  WHERE all_booking_times.booked_time >= (current_date - interval'60 day') AND all_booking_times.booked_time <= (current_date - interval '30 day')) AS prev_30) rpt;

                  
COMMIT;
