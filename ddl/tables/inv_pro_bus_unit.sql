DROP TABLE IF EXISTS inv_pro_bus_unit CASCADE;

CREATE TABLE inv_pro_bus_unit
(
   business_unit_id        VARCHAR(40)       NOT NULL,
   business_entity_id      VARCHAR(40)       NOT NULL,
   business_name           VARCHAR(100),
   contact_person          VARCHAR(100),
   contact_phone           VARCHAR(14),
   registered_address_id   VARCHAR(40),
   ihh_enabled             BOOLEAN           DEFAULT FALSE,
   subcontracting_enabled  BOOLEAN           DEFAULT FALSE,
   marketplace_enabled     BOOLEAN           DEFAULT FALSE
);

ALTER TABLE inv_pro_bus_unit
   ADD CONSTRAINT inv_pro_bus_unit_pkey
   PRIMARY KEY (business_unit_id);
   
CREATE INDEX inv_pro_bus_unit_business_unit_id_idx ON inv_pro_bus_unit USING btree (business_unit_id);

INSERT INTO inv_pro_bus_unit VALUES
('0e0ae508-be22-48ef-955e-430530b2faf0',	'PRO_COM',	'Pro.com Marketplace', NULL, NULL, NULL, false,	false,	true),
('0e0ae508-be22-48ef-955e-430530b2faf1',	'PRO_COM_HOME_SERVICES_WA',	'Pro.com Home Services', NULL, NULL, NULL, true,true, false),
('0e0ae508-be22-48ef-955e-430530b2faf2',	'PRO_COM_HOME_SERVICES_CA',	'Pro.com Home Services', NULL, NULL, NULL, true, true, false);
COMMIT;
