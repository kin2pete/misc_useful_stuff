DROP TABLE IF EXISTS lb_att_cli_typ CASCADE;

CREATE TABLE lb_att_cli_typ
(
   attribution_client_type_id  varchar(40)     DEFAULT ''::character varying NOT NULL,
   client_type                 varchar(255)    NOT NULL,
   client_browser_name         varchar(255),
   client_browser_version      varchar(255)
);

ALTER TABLE lb_att_cli_typ
   ADD CONSTRAINT lb_att_cli_typ_pkey
   PRIMARY KEY (attribution_client_type_id);
   
CREATE INDEX lb_att_cli_typ_attribution_client_type_id_idx ON lb_att_cli_typ USING btree (attribution_client_type_id);
CREATE INDEX lb_att_cli_typ_client_type_idx ON lb_att_cli_typ USING btree (client_type);

COMMIT;
