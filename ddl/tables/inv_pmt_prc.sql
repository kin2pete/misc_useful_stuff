DROP TABLE IF EXISTS inv_pmt_prc CASCADE;

CREATE TABLE inv_pmt_prc
(
   id                            varchar(40)     NOT NULL,
   name                          varchar(100)    NOT NULL,
   processor_key                 varchar(100),
   percentage_commission         float8,
   value_commission              float8,
   stripe_percentage_commission  float8,
   stripe_value_commission       float8
);

COMMIT;
