DROP TABLE IF EXISTS ms_mag_lst_itm CASCADE;

CREATE TABLE ms_mag_lst_itm
(
   magic_list_item_id              varchar(40)      NOT NULL,
   magic_list_id                   varchar(40)      NOT NULL,
   status                          varchar(45)      NOT NULL,
   parent_magic_list_item_id       varchar(40),
   search_expression               varchar(4096),
   sku_id                          varchar(40),
   answer_id                       varchar(40),
   original_sku_id                 varchar(40),
   original_answer_id              varchar(40),
   sku_match_status                varchar(45),
   complexity_index                integer          NOT NULL,
   uom_type                        varchar(45),
   uom_quantity                    integer,
   uom_length                      integer,
   uom_width                       integer,
   uom_height                      integer,
   order_id                        varchar(40),
   referral_id                     varchar(40),
   low_estimate                    numeric(11,2),
   high_estimate                   numeric(11,2),
   active_human_recommendation_id  varchar(40),
   admin_notes                     varchar(4096),
   sort_order                      integer          NOT NULL,
   created_time                    timestamp        NOT NULL,
   updated_time                    timestamp        NOT NULL,
   service_request_id              varchar(40),
   is_fixed_price                  boolean          DEFAULT false NOT NULL,
   price_basis_description         varchar(255),
   is_guaranteed                   boolean          DEFAULT false NOT NULL
);

ALTER TABLE ms_mag_lst_itm
   ADD CONSTRAINT ms_mag_lst_itm_pkey
   PRIMARY KEY (magic_list_item_id);

CREATE INDEX ms_mag_lst_itm_magic_list_id_idx ON ms_mag_lst_itm USING btree (magic_list_id);
CREATE INDEX ms_mag_lst_itm_parent_magic_list_item_id_idx ON ms_mag_lst_itm USING btree (parent_magic_list_item_id);
CREATE INDEX ms_mag_lst_itm_sku_id_idx ON ms_mag_lst_itm USING btree (sku_id);
CREATE INDEX ms_mag_lst_itm_original_sku_id_idx ON ms_mag_lst_itm USING btree (original_sku_id);
CREATE INDEX ms_mag_lst_itm_order_id_idx ON ms_mag_lst_itm USING btree (order_id);
CREATE INDEX ms_mag_lst_itm_service_request_id_idx ON ms_mag_lst_itm USING btree (service_request_id);
   
COMMIT;
