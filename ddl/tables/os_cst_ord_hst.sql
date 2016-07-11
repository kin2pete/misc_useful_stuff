DROP TABLE IF EXISTS os_cst_ord_hst CASCADE;

CREATE TABLE os_cst_ord_hst
(
   customer_order_history_id  varchar(40)      NOT NULL,
   customer_order_id          varchar(40),
   magic_list_id              varchar(40),
   customer_id                varchar(40),
   service_address_id         varchar(40),
   channel                    varchar(64)      NOT NULL,
   service_provider_id        varchar(40),
   service_provider_sticky    boolean          NOT NULL,
   service_provider_crew_id   varchar(40),
   order_status               varchar(255),
   order_type                 varchar(16),
   booking_policy             varchar(64),
   service_timezone           varchar(32),
   reject_reason              varchar(4096),
   cancel_reason              varchar(4096),
   service_start_time         timestamp,
   service_start_time_in_iso  varchar(40),
   service_end_time           timestamp,
   service_end_time_in_iso    varchar(40),
   booked_time                timestamp,
   pre_visit_notes            varchar(4096),
   zip_code                   varchar(10),
   created_time               timestamp        NOT NULL,
   updated_time               timestamp        NOT NULL,
   reject_reason_id           varchar(40),
   cancel_reason_id           varchar(40),
   billing_amount             numeric(11,2),
   billing_deviation_reason   varchar(4096),
   deal_code                  varchar(40),
   gift_code                  varchar(40),
   state_change_time          timestamp,
   offer_variation_id         varchar(40),
   state_changer              varchar(256),
   block_no_slot              boolean,
   is_back_filled_order       boolean,
   complete_reason_id         varchar(40),
   only_estimate_needed       boolean,
   partial_order_id           varchar(40),
   payment_confirmation_id    varchar(255),
   revenue_type 			  varchar(45) DEFAULT NULL,
   is_billable 				  boolean DEFAULT TRUE,
   is_billable_reason 		  varchar(45) DEFAULT NULL
);

CREATE INDEX os_cst_ord_hst_customer_order_id_idx ON os_cst_ord_hst USING btree (customer_order_id);
CREATE INDEX os_cst_ord_hst_partial_order_id_idx ON os_cst_ord_hst USING btree (partial_order_id);
CREATE INDEX os_cst_ord_hst_service_provider_id_idx ON os_cst_ord_hst USING btree (service_provider_id);
CREATE INDEX os_cst_ord_hst_customer_id_idx ON os_cst_ord_hst USING btree (customer_id);
CREATE INDEX os_cst_ord_hst_order_status_idx ON os_cst_ord_hst USING btree (order_status);
CREATE INDEX os_cst_ord_hst_channel_idx ON os_cst_ord_hst USING btree (channel);
CREATE INDEX os_cst_ord_hst_magic_list_id_idx ON os_cst_ord_hst USING btree (magic_list_id);

COMMIT;
