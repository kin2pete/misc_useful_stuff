DROP TABLE IF EXISTS ss_reg_met CASCADE;

CREATE TABLE ss_reg_met
(
   id                          integer      NOT NULL,
   date                        timestamp    NOT NULL,
   terms                       integer      NOT NULL,
   searches                    integer      NOT NULL,
   hits                        integer      NOT NULL,
   good_hits                   integer      NOT NULL,
   single_hits                 integer      NOT NULL,
   close_top_hits              integer      NOT NULL,
   had_expectation             integer      NOT NULL,
   matched_expectation         integer      NOT NULL,
   unique_terms                integer      NOT NULL,
   unique_searches             integer      NOT NULL,
   unique_hits                 integer      NOT NULL,
   unique_good_hits            integer      NOT NULL,
   unique_single_hits          integer      NOT NULL,
   unique_close_top_hits       integer      NOT NULL,
   unique_had_expectation      integer      NOT NULL,
   unique_matched_expectation  integer      NOT NULL
);

COMMIT;
