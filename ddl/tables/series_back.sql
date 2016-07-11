DROP TABLE IF EXISTS series_back CASCADE;

CREATE TABLE series_back
(
   back  integer    NOT NULL
);

ALTER TABLE series_back
   ADD CONSTRAINT series_back_pkey
   PRIMARY KEY (back);

COMMIT;
