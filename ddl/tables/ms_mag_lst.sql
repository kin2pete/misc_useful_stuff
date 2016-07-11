DROP TABLE IF EXISTS ms_mag_lst CASCADE;

CREATE TABLE ms_mag_lst
(
   magic_list_id                  varchar(40)      NOT NULL,
   status                         varchar(45),
   customer_id                    varchar(40),
   session_id                     varchar(40),
   admin_notes                    varchar(4096),
   customer_label                 varchar(4096),
   zip_code                       varchar(10),
   preferred_service_provider_id  varchar(40),
   etag                           bigint           NOT NULL,
   created_time                   timestamp        NOT NULL,
   updated_time                   timestamp        NOT NULL,
   short_id                       varchar(10),
   is_test_list                   boolean          DEFAULT false NOT NULL,
   has_offers                     boolean          DEFAULT false NOT NULL
);

ALTER TABLE ms_mag_lst
   ADD CONSTRAINT ms_mag_lst_pkey
   PRIMARY KEY (magic_list_id);

CREATE INDEX ms_mag_lst_customer_id_idx ON ms_mag_lst USING btree (customer_id);

COMMIT;
