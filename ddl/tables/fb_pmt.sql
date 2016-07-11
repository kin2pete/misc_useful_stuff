DROP TABLE IF EXISTS fb_pmt CASCADE;

CREATE TABLE fb_pmt
(
   payment_id            integer          NOT NULL,
   invoice_id            integer,
   payment_date          date             NOT NULL,
   payment_type          varchar(40)      NOT NULL,
   notes                 varchar(4096),
   client_id             integer          NOT NULL,
   amount                numeric(11,2)    NOT NULL,
   updated               timestamp        NOT NULL,
   currency_code         varchar(10),
   gateway_reference_id  varchar(128),
   gateway_name          varchar(128),
   from_credit           boolean          NOT NULL
);

COMMIT;
