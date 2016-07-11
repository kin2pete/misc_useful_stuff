select a_booked_date as booked_date, DATEDIFF(day, a_booked_date, current_date) AS days_since,
  isnull(sr_till_date, 0) sr_till_date, isnull(good_sr_till_date, 0) good_sr_till_date,
  isnull(good_sr_15_till_date, 0) good_sr_15_till_date, isnull(till_date_percent, 0) till_date_percent, 
  isnull(till_15_date_percent, 0) till_15_date_percent, isnull(sr_on_date, 0) sr_on_date, 
  isnull(good_sr_on_date, 0) good_sr_on_date, isnull(on_date_percent, 0) on_date_percent,
  tp50, cum50, tp90, cum90, tp95, cum95, tp99, cum99, tp100, cum100
from
 (select cum_count_table.a_booked_date, cum_count_table.sr_till_date, cum_count_table.good_sr_till_date,
        cum_count_table.good_sr_15_till_date, 
        round(cum_count_table.good_sr_till_date * 100.0 / cum_count_table.sr_till_date, 2) till_date_percent,
        round(cum_count_table.good_sr_15_till_date * 100.0 / cum_count_table.sr_till_date, 2) till_15_date_percent,
        single_count_table.sr_till_date sr_on_date, single_count_table.good_sr_till_date good_sr_on_date,
        round(single_count_table.good_sr_till_date * 100.0 / single_count_table.sr_till_date, 2) on_date_percent
    from
        (select total_cnt_tbl.a_booked_date, sr_till_date, good_sr_till_date, good_sr_15_till_date
        from
            (select a_booked_date, count(*) sr_till_date
            from
                (select distinct(booked_time::date) a_booked_date
                from os_ptl_ord
                where booked_time > CURRENT_DATE - interval '121 day')
                inner join
                (
                select *
                from os_ptl_ord po
                where po.customer_id in (select id from ci_cst)
                    and booked_time > CURRENT_DATE - interval '121 day') as po
                on a_booked_date <= po.booked_time::date
            group by a_booked_date) total_cnt_tbl
            full outer join            
                (select GREATEST(a_booked_date_5,a_booked_date_15) a_booked_date, good_sr_till_date,good_sr_15_till_date
                 from                
                    (select a_booked_date_5, count(*) good_sr_till_date
                    from
                        (select distinct(booked_time::date) a_booked_date_5
                        from os_ptl_ord
                        where booked_time > CURRENT_DATE - interval '121 day'
                        order by a_booked_date_5 desc)
                        inner join
                        (
                        select *
                        from os_ptl_ord po
                        where po.customer_id in (select id from ci_cst)
                            and booked_time > CURRENT_DATE - interval '121 day'
                            and po.booked_time < first_voice_time
                            and po.booked_time + interval '5 minute' > first_voice_time
                            ) as po
                        on a_booked_date_5 <= po.booked_time::date
                    group by a_booked_date_5) good_sr_5_tbl     
                full outer join                
                    (select a_booked_date_15, count(*) good_sr_15_till_date
                    from
                        (select distinct(booked_time::date) a_booked_date_15
                        from os_ptl_ord
                        where booked_time > CURRENT_DATE - interval '121 day'
                        order by a_booked_date_15 desc)
                        inner join
                        (
                        select *
                        from os_ptl_ord po_15
                        where po_15.customer_id in (select id from ci_cst)
                            and booked_time > CURRENT_DATE - interval '121 day'
                            and po_15.booked_time < first_voice_time
                            and po_15.booked_time + interval '15 minute' > first_voice_time
                            ) as po_15
                        on a_booked_date_15 <= po_15.booked_time::date
                    group by a_booked_date_15) good_sr_15_tbl            
                on good_sr_5_tbl.a_booked_date_5=good_sr_15_tbl.a_booked_date_15
            )  good_sr_tbl            
            on total_cnt_tbl.a_booked_date=good_sr_tbl.a_booked_date) cum_count_table
        full outer join
        (select total_cnt_tbl.a_booked_date, sr_till_date, good_sr_till_date
        from
            (select a_booked_date, count(*) sr_till_date
            from
                (select distinct(booked_time::date) a_booked_date
                from os_ptl_ord
                where booked_time > CURRENT_DATE - interval '121 day')
                inner join
                (
                select *
                from os_ptl_ord po
                where po.customer_id in (select id from ci_cst)
                    and booked_time > CURRENT_DATE - interval '121 day') as po
                on a_booked_date = po.booked_time::date
            group by a_booked_date) total_cnt_tbl
            full outer join
            (select a_booked_date, count(*) good_sr_till_date
            from
                (select distinct(booked_time::date) a_booked_date
                from os_ptl_ord
                where booked_time > CURRENT_DATE - interval '121 day'
                order by a_booked_date desc)
                inner join
                (
                select *
                from os_ptl_ord po
                where po.customer_id in (select id from ci_cst)
                    and booked_time > CURRENT_DATE - interval '121 day'
                    and po.booked_time < first_voice_time
                    and po.booked_time + interval '5 minute' > first_voice_time
                    ) as po
                on a_booked_date = po.booked_time::date
            group by a_booked_date) good_sr_tbl
            on total_cnt_tbl.a_booked_date=good_sr_tbl.a_booked_date) single_count_table
        on cum_count_table.a_booked_date=single_count_table.a_booked_date) count_table
    FULL OUTER JOIN
    (select booked_date, tp50, cum50, tp90, cum90, tp95, cum95, tp99, cum99, tp100, cum100
    from
        (select booked_date, min(pct_50) TP50, min(pct_90) TP90, min(pct_95) TP95, min(pct_99) TP99, min(pct_100) TP100
        from
            (select booked_date,
                percentile_disc(0.50) WITHIN GROUP (ORDER BY min_diff) OVER (partition by booked_date) pct_50,
                percentile_disc(0.90) WITHIN GROUP (ORDER BY min_diff) OVER (partition by booked_date) pct_90,
                percentile_disc(0.95) WITHIN GROUP (ORDER BY min_diff) OVER (partition by booked_date) pct_95,
                percentile_disc(0.99) WITHIN GROUP (ORDER BY min_diff) OVER (partition by booked_date) pct_99,
                percentile_disc(1.00) WITHIN GROUP (ORDER BY min_diff) OVER (partition by booked_date) pct_100
            from
                (select po.booked_time::date booked_date, po.partial_order_id poid,
                    (EXTRACT(EPOCH FROM (first_voice_time - booked_time)) / 60) min_diff
                from os_ptl_ord po
                where po.customer_id in (select id from ci_cst) 
                    and booked_time > CURRENT_DATE - interval '121 day'
                    and booked_time >= (select min(first_voice_time) min_fvt from os_ptl_ord where first_voice_time is not null)
                    and booked_time < first_voice_time))
        group by booked_date) tp_table
        INNER JOIN
        (select a_booked_date, min(t_cum_50) CUM50, min(t_cum_90) CUM90, min(t_cum_95) CUM95, min(t_cum_99) CUM99, min(t_cum_100) CUM100
        from
            (
            select a_booked_date,
                percentile_disc(0.50) WITHIN GROUP (ORDER BY min_diff) OVER (partition by a_booked_date) t_cum_50,
                percentile_disc(0.90) WITHIN GROUP (ORDER BY min_diff) OVER (partition by a_booked_date) t_cum_90,
                percentile_disc(0.95) WITHIN GROUP (ORDER BY min_diff) OVER (partition by a_booked_date) t_cum_95,
                percentile_disc(0.99) WITHIN GROUP (ORDER BY min_diff) OVER (partition by a_booked_date) t_cum_99,
                percentile_disc(1.00) WITHIN GROUP (ORDER BY min_diff) OVER (partition by a_booked_date) t_cum_100
            from
                (select distinct(booked_time::date) a_booked_date
                from os_ptl_ord
                where booked_time > CURRENT_DATE - interval '121 day'
                    and booked_time < first_voice_time) all_booked_times
                inner join
                (select po.booked_time::date b_booked_date, po.partial_order_id poid,
                    (EXTRACT(EPOCH FROM (first_voice_time - booked_time)) / 60) min_diff
                from os_ptl_ord po
                where po.customer_id in (select id from ci_cst) 
                    and booked_time > CURRENT_DATE - interval '121 day'
                    and booked_time >=
                    (select min(first_voice_time) min_fvt
                    from os_ptl_ord
                    where first_voice_time is not null)
                    and booked_time < first_voice_time) po_resp_time
                on a_booked_date <= b_booked_date)
        group by a_booked_date) cum_table
        on tp_table.booked_date = cum_table.a_booked_date) metric_table
    on count_table.a_booked_date = metric_table.booked_date
order by count_table.a_booked_date desc;



2015-07-07  8.3116666666666656
2015-07-06  106.43333333333332



