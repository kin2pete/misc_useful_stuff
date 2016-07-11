DROP TABLE IF EXISTS inv_cms_rat CASCADE;

CREATE TABLE inv_cms_rat
(
   id                        varchar(40)      NOT NULL,
   order_id                  varchar(40),
   provider_id               varchar(40)      NOT NULL,
   created_time              timestamp        NOT NULL,
   commission_for            varchar(32)      NOT NULL,
   cost_range_lower_end      numeric(11,2)    NOT NULL,
   cost_range_higher_end     numeric(11,2)    NOT NULL,
   labour_commission_rate    numeric(7,4),
   material_commission_rate  numeric(7,4),
   commission_rate           numeric(7,4),
   service_request_id    	 varchar(40)
);

ALTER TABLE inv_cms_rat
   ADD CONSTRAINT inv_cms_rat_pkey
   PRIMARY KEY (id);
   
CREATE INDEX inv_cms_rat_provider_id_idx ON inv_cms_rat USING btree (provider_id);
CREATE INDEX inv_cms_rat_service_request_id_idx ON inv_cms_rat USING btree (service_request_id);

COMMIT;
