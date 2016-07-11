DROP TABLE IF EXISTS sync_test CASCADE;

CREATE TABLE sync_test
(
   id  integer      NOT NULL,
   d1  date         NOT NULL,
   t1  timestamp    NOT NULL,
   t2  timestamp    NOT NULL
);

COMMIT;
