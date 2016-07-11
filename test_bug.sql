DROP VIEW zip_tst;
DROP TABLE zip_tst_cnt;
DROP TABLE zip_tst_bnd;
DROP TABLE zip_tst_tbl;

CREATE TABLE zip_tst_cnt (
  zip VARCHAR(5) NOT NULL,
  enczip VARCHAR(5) NULL
)
DISTKEY(zip)
;

INSERT INTO zip_tst_cnt(zip, enczip) VALUES ('68757', NULL);
INSERT INTO zip_tst_cnt(zip, enczip) VALUES ('75501', NULL);
INSERT INTO zip_tst_cnt(zip, enczip) VALUES ('75505', '75501');
INSERT INTO zip_tst_cnt(zip, enczip) VALUES ('75599', '75501');
COMMIT;
CREATE TABLE zip_tst_bnd (
  zip VARCHAR(5) NOT NULL
)
DISTKEY(zip)
;
INSERT INTO zip_tst_bnd(zip) VALUES ('68757');
INSERT INTO zip_tst_bnd(zip) VALUES ('75501');
CREATE VIEW zip_tst AS
SELECT
  zip,
  zip AS enczip
FROM
  zip_tst_bnd
UNION
SELECT
  zip,
  enczip
FROM
  zip_tst_cnt
WHERE
  zip NOT IN (SELECT zip FROM zip_tst_bnd)
;
--GRANT SELECT ON  zip_tst_cnt TO report;
--GRANT SELECT ON  zip_tst_bnd TO report;
--GRANT SELECT ON  zip_tst TO report;
COMMIT;

CREATE TABLE zip_tst_tbl (
  zip VARCHAR(5) NOT NULL,
  enczip VARCHAR(5) NULL
)
DISTKEY(zip)
;

INSERT INTO zip_tst_tbl(zip, enczip) VALUES ('68757', '68757');
INSERT INTO zip_tst_tbl(zip, enczip) VALUES ('75501', '75501');
INSERT INTO zip_tst_tbl(zip, enczip) VALUES ('75505', '75501');
INSERT INTO zip_tst_tbl(zip, enczip) VALUES ('75599', '75501');

--GRANT SELECT ON  zip_tst_tbl TO report;
COMMIT;

---- TEST SQL ----

WITH zip_tst_tmp AS 
(
SELECT
  zip,
  zip AS enczip
FROM
  zip_tst_bnd
UNION
SELECT
  zip,
  enczip
FROM
  zip_tst_cnt
WHERE
  zip NOT IN (SELECT zip FROM zip_tst_bnd)
), counts AS
( 
-- VIEW --
SELECT COUNT(DISTINCT(enczip)) AS count_view FROM zip_tst
), count_table AS
(
-- TABLE --
SELECT COUNT(DISTINCT(enczip)) AS count_table FROM zip_tst_tbl
),  count_with AS
(
-- WITH --
SELECT COUNT(DISTINCT(enczip)) AS count_with FROM zip_tst_tmp
)

SELECT
  (SELECT COUNT(DISTINCT enczip) FROM zip_tst) AS count_view,
  (SELECT COUNT(DISTINCT enczip) FROM zip_tst_tbl) AS count_table,
  (SELECT COUNT(DISTINCT enczip) FROM zip_tst_tmp) AS count_with

