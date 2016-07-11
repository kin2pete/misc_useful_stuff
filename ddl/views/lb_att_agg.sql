CREATE OR REPLACE VIEW lb_att_agg
(
  attribution_channel_id,
  attribution_source,
  attribution_medium,
  attribution_campaign,
  attribution_content,
  attribution_shortkey,
  attribution_utm_terms,
  description,
  attribution_record_id,
  attribution_client_type_id,
  attribution_http_request_id,
  session_id,
  customer_id,
  channel_entry,
  admin_user,
  customer_contact_medium,
  attribution_record_created_at,
  match_type,
  match_position,
  attribution_event_id,
  event_type,
  magic_list_id,
  service_request_id,
  custom_event_string,
  attribution_event_created_at,
  order_id
)
AS 
 SELECT c.attribution_channel_id, c.attribution_source, c.attribution_medium, c.attribution_campaign, c.attribution_content, c.attribution_shortkey, c.attribution_utm_terms, c.description, r.attribution_record_id, r.attribution_client_type_id, r.attribution_http_request_id, r.session_id, r.customer_id, r.channel_entry, r.admin_user, r.customer_contact_medium, r.created_at AS attribution_record_created_at, r.match_type, r.match_position, e.attribution_event_id, e.event_type, e.magic_list_id, e.service_request_id, e.custom_event_string, e.created_at AS attribution_event_created_at, e.order_id
   FROM lb_att_chn c, lb_att_rec r, lb_att_evt e
  WHERE r.attribution_channel_id::text = c.attribution_channel_id::text AND e.attribution_record_id::text = r.attribution_record_id::text;


GRANT SELECT ON lb_att_agg TO report;


COMMIT;
