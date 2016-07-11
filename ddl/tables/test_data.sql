DROP TABLE IF EXISTS test_data CASCADE;

CREATE TABLE test_data
(
   id  integer      NOT NULL,
   d1  date         NOT NULL,
   t1  timestamp    NOT NULL,
   t2  timestamp    NOT NULL
);

COMMIT;
