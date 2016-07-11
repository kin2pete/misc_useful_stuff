DROP TABLE IF EXISTS inv_pro_bus_ent CASCADE;

CREATE TABLE inv_pro_bus_ent
(
   business_entity_id     VARCHAR(40)       NOT NULL,
   business_legal_name    VARCHAR(100)   	NOT NULL,
   contact_person         VARCHAR(100),
   contact_phone          VARCHAR(14),
   state                  VARCHAR(50),
   country                VARCHAR(50),
   business_entity_type   VARCHAR(10),
   registered_address_id  VARCHAR(10)

);

ALTER TABLE inv_pro_bus_ent
   ADD CONSTRAINT inv_pro_bus_ent_pkey
   PRIMARY KEY (business_entity_id);
   
CREATE INDEX inv_pro_bus_ent_business_entity_id_idx ON inv_pro_bus_ent USING btree (business_entity_id);

INSERT INTO inv_pro_bus_ent VALUES
('PRO_COM',	'Pro.com', NULL, NULL, NULL, NULL, 'NATIONAL', NULL),	
('PRO_COM_HOME_SERVICES_CA',	'Pro.com Home Services - California', NULL, NULL, NULL, NULL, 'STATE', NULL),	
('PRO_COM_HOME_SERVICES_WA',	'Pro.com Home Services - Washington', NULL, NULL, NULL, NULL, 'STATE', NULL);

COMMIT;
