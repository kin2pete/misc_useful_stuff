DROP TABLE IF EXISTS fb_inv CASCADE;

CREATE TABLE fb_inv
(
   invoice_id          integer          NOT NULL,
   invoice_number      integer          NOT NULL,
   client_id           integer          NOT NULL,
   organization        varchar(128),
   first_name          varchar(128)     NOT NULL,
   last_name           varchar(128)     NOT NULL,
   street1             varchar(128),
   street2             varchar(128),
   city                varchar(128),
   state               varchar(40),
   country             varchar(40),
   postal_code         varchar(40),
   status              varchar(40)      NOT NULL,
   amount              numeric(11,2)    NOT NULL,
   amount_outstanding  numeric(11,2)    NOT NULL,
   invoice_date        date             NOT NULL,
   notes               varchar(4096),
   terms               varchar(128)     NOT NULL,
   discount            numeric(11,2)    NOT NULL,
   updated             timestamp        NOT NULL,
   staff_id            integer          NOT NULL
);

COMMIT;
