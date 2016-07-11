DROP TABLE IF EXISTS wf_wrk_itm_act_trn CASCADE;

CREATE TABLE wf_wrk_itm_act_trn
(
   work_item_id           varchar(40)     NOT NULL,
   partial_order_id       varchar(40)     NOT NULL,
   work_item_activity_id  varchar(40)     NOT NULL,
   rank_id                bigint,
   magic_list_id          varchar(40),
   customer_id            varchar(40),
   service_address_id     varchar(40),
   booked_time            timestamp,
   status                 varchar(50),
   created_time           timestamp,
   created_day            char(10),
   created_week           char(7),
   created_month          char(7),
   created_quarter        char(7),
   created_year           char(4),
   next_status            varchar(256),
   next_created_time      timestamp,
   next_created_day       char(10),
   next_created_week      char(7),
   next_created_month     char(7),
   next_created_quarter   char(7),
   next_created_year      char(4),
   channel                varchar(64),
   day                    char(10),
   week                   char(7),
   week_beginning         char(10),
   week_ending            char(10),
   month                  char(7),
   month_beginning        char(10),
   month_ending           char(10),
   quarter                char(7),
   quarter_beginning      char(10),
   quarter_ending         char(10),
   year                   char(4),
   year_beginning         char(10),
   year_ending            char(10)
);

CREATE INDEX wf_wrk_itm_act_trn_work_item_id_idx ON wf_wrk_itm_act_trn USING btree (work_item_id);
CREATE INDEX wf_wrk_itm_act_trn_partial_order_id_idx ON wf_wrk_itm_act_trn USING btree (partial_order_id);
CREATE INDEX wf_wrk_itm_act_trn_magic_list_id_idx ON wf_wrk_itm_act_trn USING btree (magic_list_id);
CREATE INDEX wf_wrk_itm_act_trn_customer_id_idx ON wf_wrk_itm_act_trn USING btree (customer_id);
CREATE INDEX wf_wrk_itm_act_trn_status_idx ON wf_wrk_itm_act_trn USING btree (status);
CREATE INDEX wf_wrk_itm_act_trn_next_status_idx ON wf_wrk_itm_act_trn USING btree (next_status);
CREATE INDEX wf_wrk_itm_act_trn_day_idx ON wf_wrk_itm_act_trn USING btree (day);
CREATE INDEX wf_wrk_itm_act_trn_created_day_idx ON wf_wrk_itm_act_trn USING btree (created_day);
CREATE INDEX wf_wrk_itm_act_trn_week_idx ON wf_wrk_itm_act_trn USING btree (week);
CREATE INDEX wf_wrk_itm_act_trn_month_idx ON wf_wrk_itm_act_trn USING btree (month);
CREATE INDEX wf_wrk_itm_act_trn_created_month_idx ON wf_wrk_itm_act_trn USING btree (created_month);
CREATE INDEX wf_wrk_itm_act_trn_quarter_idx ON wf_wrk_itm_act_trn USING btree (quarter);
CREATE INDEX wf_wrk_itm_act_trn_year_idx ON wf_wrk_itm_act_trn USING btree (year);

COMMIT;
