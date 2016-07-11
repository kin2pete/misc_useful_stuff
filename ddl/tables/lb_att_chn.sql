DROP TABLE IF EXISTS lb_att_chn CASCADE;

CREATE TABLE lb_att_chn
(
   attribution_channel_id  varchar(40)       DEFAULT ''::character varying NOT NULL,
   attribution_source      varchar(255)      NOT NULL,
   attribution_medium      varchar(255)      NOT NULL,
   attribution_campaign    varchar(255)      NOT NULL,
   attribution_content     varchar(255)      NOT NULL,
   attribution_shortkey    varchar(40),
   attribution_utm_terms   varchar(255),
   description             varchar(4096)
);

ALTER TABLE lb_att_chn
   ADD CONSTRAINT lb_att_chn_pkey
   PRIMARY KEY (attribution_channel_id);

CREATE INDEX lb_att_chn_attribution_channel_id_idx ON lb_att_chn USING btree (attribution_channel_id);
CREATE INDEX lb_att_chn_attribution_source_idx ON lb_att_chn USING btree (attribution_source);
CREATE INDEX lb_att_chn_attribution_medium_idx ON lb_att_chn USING btree (attribution_medium);
CREATE INDEX lb_att_chn_attribution_campaign_idx ON lb_att_chn USING btree (attribution_campaign);
CREATE INDEX lb_att_chn_attribution_content_idx ON lb_att_chn USING btree (attribution_content);
CREATE INDEX lb_att_chn_attribution_shortkey_idx ON lb_att_chn USING btree (attribution_shortkey);

COMMIT;
