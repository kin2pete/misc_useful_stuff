CREATE OR REPLACE VIEW mpo_zip
(
  zip,
  name,
  ziptype,
  state,
  statefips,
  countyfips,
  countyname,
  s3dzip,
  lat,
  lon,
  enczip,
  totrescnt,
  mfdu,
  sfdu,
  boxcnt,
  bizcnt,
  relver
)
AS 
 SELECT m_cnt.zip, m_cnt.name, m_cnt.ziptype, m_cnt.state, m_cnt.statefips, m_cnt.countyfips, m_cnt.countyname, m_cnt.s3dzip, m_cnt.lat, m_cnt.lon, 
        CASE
            WHEN m_cnt.enczip IS NULL THEN m_bnd.zip
            ELSE m_cnt.enczip
        END AS enczip, m_cnt.totrescnt, m_cnt.mfdu, m_cnt.sfdu, m_cnt.boxcnt, m_cnt.bizcnt, m_cnt.relver
   FROM mpo_zip_cnt m_cnt
   LEFT JOIN mpo_zip_bnd m_bnd ON m_cnt.zip::text = m_bnd.zip::text;


GRANT SELECT ON mpo_zip TO report;


COMMIT;
