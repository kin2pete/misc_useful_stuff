DROP TABLE IF EXISTS os_cst_ref CASCADE;

CREATE TABLE os_cst_ref
(
   customer_referral_id  varchar(40)    NOT NULL,
   customer_id           varchar(40)    NOT NULL,
   zipcode               varchar(16)    NOT NULL,
   magic_list_id         varchar(40)    NOT NULL,
   csr_user_id           varchar(40),
   create_time           timestamp,
   created_time          timestamp,
   updated_time          timestamp
);

COMMIT;
