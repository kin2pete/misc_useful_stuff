CREATE OR REPLACE VIEW iso_18_weeks_back
(
  weeks_back,
  iso_year,
  iso_week_of_year,
  bow,
  eow
)
AS 
 SELECT iso_ranges.weeks_back, to_char(iso_ranges.bow::timestamp without time zone, 'IYYY'::text)::smallint AS iso_year, to_char(iso_ranges.bow::timestamp without time zone, 'IW'::text)::smallint AS iso_week_of_year, iso_ranges.bow, iso_ranges.eow
   FROM ( SELECT - weeks.back AS weeks_back, ((7 * weeks.back)::integer + iso.bopw::date)::date AS bow, ((7 * weeks.back + 6)::integer + iso.bopw::date)::date AS eow
           FROM ( 
           SELECT ( (-7 - mod(( "date_part"('dayofweek'::text, t.now::date) + 6)::integer, 7))::integer + ( t.now::date))::date AS bopw
                   FROM ( SELECT current_date AT TIME ZONE 'PST' AS now) t) iso, ( SELECT series_back.back
                   FROM series_back
                  WHERE series_back.back >= -17 AND series_back.back <= 0) weeks) iso_ranges;


GRANT SELECT ON iso_18_weeks_back TO report;


COMMIT;
