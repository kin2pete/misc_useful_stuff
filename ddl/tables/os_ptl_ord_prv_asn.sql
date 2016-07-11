DROP TABLE IF EXISTS os_ptl_ord_prv_asn CASCADE;

CREATE TABLE os_ptl_ord_prv_asn
(
   assignment_id               varchar(40)      NOT NULL,
   partial_order_id            varchar(40)      NOT NULL,
   provider_id                 integer          NOT NULL,   
   assignment_status           varchar(50),
   work_item_id                varchar(40),
   created_time                timestamp,
   updated_time                timestamp,
   timeout                     timestamp,
   notes                       varchar(4096),
   is_read                     boolean          NOT NULL,
   reject_reason_id            varchar(40),
   pro_dissatisfied_reason_id  varchar(40),
   reject_reason_text          varchar(4096),
   provider_notes              varchar(4096),
   job_satisfaction            varchar(50),
   pro_com_feedback            varchar(4096),
   assignment_type             varchar(16)      NOT NULL,
   decline_reason_text         varchar(4096),
   creation_style              varchar(16),
   customer_order_id 		   varchar(40) 		DEFAULT NULL,
   is_primary 				   boolean 			DEFAULT TRUE,
   selected_availability_id    varchar(40) 		DEFAULT NULL,
   schedule_id 				   varchar(40) 		DEFAULT NULL
);

COMMIT;
