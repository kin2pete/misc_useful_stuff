DROP TABLE IF EXISTS os_cst_ord CASCADE;

CREATE TABLE os_cst_ord
(
   customer_order_id             varchar(40)      NOT NULL,
   customer_id                   varchar(40)      NOT NULL,
   service_address_id            varchar(40)      NOT NULL,
   channel                       varchar(64)      NOT NULL,
   service_provider_id           varchar(40)      NOT NULL,
   service_provider_crew_id      varchar(40),
   service_provider_sticky       boolean          NOT NULL,
   order_status                  varchar(255),
   provider_notification_status  varchar(16),
   customer_notification_status  varchar(16),
   service_timezone              varchar(32)      NOT NULL,
   reject_reason                 varchar(4096),
   service_start_time            timestamp        NOT NULL,
   service_end_time              timestamp        NOT NULL,
   booked_time                   timestamp        NOT NULL,
   pre_visit_notes               varchar(4096),
   magic_list_id                 varchar(40)      NOT NULL,
   zip_code                      varchar(10)      NOT NULL,
   service_start_time_in_iso     varchar(40)      NOT NULL,
   service_end_time_in_iso       varchar(40)      NOT NULL,
   first_notification_status     varchar(16)      NOT NULL,
   second_notification_status    varchar(16)      NOT NULL,
   cancel_reason                 varchar(4096),
   order_type                    varchar(16)      NOT NULL,
   booking_policy                varchar(64)      NOT NULL,
   created_time                  timestamp        NOT NULL,
   updated_time                  timestamp        NOT NULL,
   reject_reason_id              varchar(40),
   cancel_reason_id              varchar(40),
   billing_deviation_reason      varchar(4096),
   billing_amount                numeric(11,2),
   deal_code                     varchar(40),
   gift_code                     varchar(40),
   offer_variation_id            varchar(40),
   reschedule_request_reason     varchar(4096),
   reschedule_preference         varchar(4096),
   block_no_slot                 boolean          NOT NULL,
   is_back_filled_order          boolean          NOT NULL,
   complete_reason_id            varchar(40),
   only_estimate_needed          boolean,
   partial_order_id              varchar(40),
   completed_time                timestamp,
   completed_time_in_iso         varchar(40),
   payment_confirmation_id       varchar(255),
   survey_participation_id       integer,
   revenue_type 			  	 varchar(45) DEFAULT NULL,
   is_billable 				  	 boolean DEFAULT TRUE,
   is_billable_reason 		  	 varchar(45) DEFAULT NULL
);

ALTER TABLE os_cst_ord
   ADD CONSTRAINT os_cst_ord_pkey
   PRIMARY KEY (customer_order_id);

CREATE INDEX os_cst_ord_customer_order_id_idx ON os_cst_ord USING btree (customer_order_id);
CREATE INDEX os_cst_ord_partial_order_id_idx ON os_cst_ord USING btree (partial_order_id);
CREATE INDEX os_cst_ord_service_provider_id_idx ON os_cst_ord USING btree (service_provider_id);
CREATE INDEX os_cst_ord_customer_id_idx ON os_cst_ord USING btree (customer_id);
CREATE INDEX os_cst_ord_order_status_idx ON os_cst_ord USING btree (order_status);
CREATE INDEX os_cst_ord_channel_idx ON os_cst_ord USING btree (channel);
CREATE INDEX os_cst_ord_magic_list_id_idx ON os_cst_ord USING btree (magic_list_id);
CREATE INDEX os_cst_ord_survey_participation_id_idx ON os_cst_ord USING btree (survey_participation_id);

COMMIT;
