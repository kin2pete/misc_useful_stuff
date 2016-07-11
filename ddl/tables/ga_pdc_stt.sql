DROP TABLE IF EXISTS ga_pdc_stt CASCADE;

CREATE TABLE ga_pdc_stt
(
   day         date           NOT NULL,
   medium      varchar(20)    NOT NULL,
   sessions    integer        NOT NULL,
   page_views  integer        NOT NULL,
   bounces     integer        NOT NULL,
   goal_1      integer        NOT NULL,
   goal_3      integer        NOT NULL
);

COMMIT;
