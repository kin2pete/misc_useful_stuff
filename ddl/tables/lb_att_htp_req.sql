DROP TABLE IF EXISTS lb_att_htp_req CASCADE;

CREATE TABLE lb_att_htp_req
(
   attribution_http_request_id  varchar(40)     DEFAULT ''::character varying NOT NULL,
   http_request_url             varchar(255)    NOT NULL,
   http_request_from            varchar(255),
   http_request_referer         varchar(255),
   http_request_origin          varchar(255)
);

ALTER TABLE lb_att_htp_req
   ADD CONSTRAINT lb_att_htp_req_pkey
   PRIMARY KEY (attribution_http_request_id);

COMMIT;
