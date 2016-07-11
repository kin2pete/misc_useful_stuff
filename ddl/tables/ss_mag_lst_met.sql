DROP TABLE IF EXISTS ss_mag_lst_met CASCADE;

CREATE TABLE ss_mag_lst_met
(
   id                integer        NOT NULL,
   date              timestamp      NOT NULL,
   period            varchar(16)    NOT NULL,
   magic_lists       integer,
   magic_list_items  integer,
   searches          integer,
   unique_terms      integer,
   new_unique_terms  integer,
   matches           integer,
   changes           integer,
   removals          integer,
   bookings          integer,
   referrals         integer
);

COMMIT;
