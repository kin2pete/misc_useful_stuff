DROP TABLE IF EXISTS os_ptl_ord CASCADE;

CREATE TABLE os_ptl_ord
(
   partial_order_id                        varchar(40)      NOT NULL,
   magic_list_id                           varchar(40),
   customer_id                             varchar(40),
   service_address_id                      varchar(40),
   partial_order_transactionality_type     varchar(40),
   gift_code                               varchar(40),
   offer_variation_id                      varchar(40),
   service_provider_sticky                 boolean,
   order_type                              varchar(40),
   channel                                 varchar(64),
   booked_time                             timestamp,
   booked_time_in_iso                      varchar(40),
   customer_order_id                       varchar(40),
   notes                                   varchar(4096),
   work_item_id                            varchar(40),
   third_party_id                          varchar(120),
   order_creation_desk_case_id             varchar(120),
   customer_requested_service_provider_id  varchar(40),
   customer_intent                         varchar(20),
   current_assignment_id                   varchar(38),
   deal_code                               varchar(40),
   partial_order_status                    varchar(50),
   cancel_reason_id                        varchar(40),
   cancel_reason                           varchar(4096),
   should_confirm_order                    boolean,
   is_backfill                             boolean,
   has_off_hours                           boolean,
   first_voice_time                        timestamp,
   channel_entry                           varchar(50),
   is_test                                 boolean          DEFAULT false NOT NULL,
   campaign_code                           varchar(50),
   partial_order_type                      varchar(1024),
   service_address_verified 			   BOOLEAN DEFAULT FALSE,
   business_unit_id 					   varchar(40), 
   sourcing_strategy 					   varchar(40)
);

ALTER TABLE os_ptl_ord
   ADD CONSTRAINT os_ptl_ord_pkey
   PRIMARY KEY (partial_order_id);

CREATE INDEX os_ptl_ord_partial_order_id_idx ON os_ptl_ord USING btree (partial_order_id);
CREATE INDEX os_ptl_ord_work_item_id_idx ON os_ptl_ord USING btree (work_item_id);
CREATE INDEX os_ptl_ord_customer_order_id_idx ON os_ptl_ord USING btree (customer_order_id);
CREATE INDEX os_ptl_ord_magic_list_id_idx ON os_ptl_ord USING btree (magic_list_id);
CREATE INDEX os_ptl_ord_customer_id_idx ON os_ptl_ord USING btree (customer_id);
CREATE INDEX os_ptl_ord_partial_order_status_idx ON os_ptl_ord USING btree (partial_order_status);


COMMIT;
