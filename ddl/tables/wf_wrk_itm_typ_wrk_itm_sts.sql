DROP TABLE IF EXISTS wf_wrk_itm_typ_wrk_itm_sts CASCADE;

CREATE TABLE wf_wrk_itm_typ_wrk_itm_sts
(
   work_item_type  varchar(40)    NOT NULL,
   state           varchar(40)    NOT NULL,
   sort_order      integer        NOT NULL,
   manual_step     boolean        NOT NULL,
   hours           integer,
   terminal_state  boolean        NOT NULL
);

COMMIT;
