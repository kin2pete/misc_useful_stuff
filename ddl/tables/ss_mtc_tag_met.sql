DROP TABLE IF EXISTS ss_mtc_tag_met CASCADE;

CREATE TABLE ss_mtc_tag_met
(
   id                  integer        NOT NULL,
   date                timestamp      NOT NULL,
   period              varchar(16)    NOT NULL,
   total_tags          integer,
   skus_tagged         integer,
   sku_answers_tagged  integer,
   primary_tags        integer,
   close_tags          integer,
   bad_tags            integer,
   future_tags         integer,
   multi_tags          integer,
   broad_tags          integer,
   dont_know_tags      integer
);

COMMIT;
