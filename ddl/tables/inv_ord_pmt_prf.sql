DROP TABLE IF EXISTS inv_ord_pmt_prf CASCADE;

CREATE TABLE inv_ord_pmt_prf
(
   id                    varchar(40)      NOT NULL,
   service_request_id    varchar(40)      NOT NULL,
   payment_processor_id  varchar(40)      NOT NULL,
   notes                 varchar(4096),
   created_time          timestamp        NOT NULL,
   updated_time          timestamp        NOT NULL,
   created_by            varchar(40),
   updated_by            varchar(40)
);

COMMIT;
