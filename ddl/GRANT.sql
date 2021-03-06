CREATE ROLE report WITH PASSWORD 'ILZgTQ4teW2Z';
ALTER ROLE report WITH LOGIN;
GRANT SELECT ON bb_ext_wrk_hrs TO report;
GRANT SELECT ON bb_prv_bus_hrs TO report;
GRANT SELECT ON bb_prv_sch TO report;
GRANT SELECT ON bb_wk_rtn TO report;
GRANT SELECT ON build_jobs TO report;
GRANT SELECT ON ca_est_trd TO report;
GRANT SELECT ON ca_sku TO report;
GRANT SELECT ON ca_trd TO report;
GRANT SELECT ON ci_cst TO report;
GRANT SELECT ON ci_cst_adr TO report;
GRANT SELECT ON dsk_adr TO report;
GRANT SELECT ON dsk_cst TO report;
GRANT SELECT ON dsk_cst_adr TO report;
GRANT SELECT ON dsk_cst_eml TO report;
GRANT SELECT ON dsk_cst_phn TO report;
GRANT SELECT ON dsk_eml TO report;
GRANT SELECT ON dsk_phn TO report;
GRANT SELECT ON dw_abr TO report;
GRANT SELECT ON dw_src TO report;
GRANT SELECT ON fb_inv TO report;
GRANT SELECT ON fb_inv_lin TO report;
GRANT SELECT ON fb_pmt TO report;
GRANT SELECT ON ga_pdc_stt TO report;
GRANT SELECT ON id_com_itf TO report;
GRANT SELECT ON id_usr TO report;
GRANT SELECT ON inv_bll TO report;
GRANT SELECT ON inv_bll_hst TO report;
GRANT SELECT ON inv_bll_pho TO report;
GRANT SELECT ON inv_cms_rat TO report;
GRANT SELECT ON inv_cst TO report;
GRANT SELECT ON inv_cst_acc TO report;
GRANT SELECT ON inv_cst_pmt TO report;
GRANT SELECT ON inv_cst_pmt_hst TO report;
GRANT SELECT ON inv_cst_pmt_mth TO report;
GRANT SELECT ON inv_inv_lin_itm TO report;
GRANT SELECT ON inv_inv_scp_adj TO report;
GRANT SELECT ON inv_manual TO report;
GRANT SELECT ON inv_ord_pmt_prf TO report;
GRANT SELECT ON inv_ord_prc_fee TO report;
GRANT SELECT ON inv_pdc_crd TO report;
GRANT SELECT ON inv_pmt_prc TO report;
GRANT SELECT ON inv_prv_acc TO report;
GRANT SELECT ON inv_prv_pmt TO report;
GRANT SELECT ON inv_ptl_ord_inv_amt TO report;
GRANT SELECT ON inv_sch_pmt_cfg TO report;
GRANT SELECT ON jm_cst_job_mgr TO report;
GRANT SELECT ON jm_grp_cs_cty TO report;
GRANT SELECT ON jm_job_mgr_avl TO report;
GRANT SELECT ON jm_job_mgr_avl_hst TO report;
GRANT SELECT ON jobs_manual TO report;
GRANT SELECT ON jobs_manual_cst TO report;
GRANT SELECT ON jobs_manual_extra TO report;
GRANT SELECT ON jobs_manual_prv TO report;
GRANT SELECT ON lb_att_chn TO report;
GRANT SELECT ON lb_att_cli_typ TO report;
GRANT SELECT ON lb_att_evt TO report;
GRANT SELECT ON lb_att_htp_req TO report;
GRANT SELECT ON lb_att_rec TO report;
GRANT SELECT ON maj_evt TO report;
GRANT SELECT ON manual_pros TO report;
GRANT SELECT ON mi_cbsa TO report;
GRANT SELECT ON mi_cbsa_csa TO report;
GRANT SELECT ON mi_cbsa_cty TO report;
GRANT SELECT ON mi_cbsa_pop TO report;
GRANT SELECT ON mi_cbsa_type TO report;
GRANT SELECT ON mi_csa TO report;
GRANT SELECT ON mi_csa_cty TO report;
GRANT SELECT ON mi_cty_pos TO report;
GRANT SELECT ON mi_fips_county TO report;
GRANT SELECT ON mi_fips_place TO report;
GRANT SELECT ON mi_fips_state TO report;
GRANT SELECT ON mi_met_div TO report;
GRANT SELECT ON mi_met_div_cty TO report;
GRANT SELECT ON mi_zcta_cbsa TO report;
GRANT SELECT ON mi_zcta_county TO report;
GRANT SELECT ON mi_zcta_place TO report;
GRANT SELECT ON mi_zip TO report;
GRANT SELECT ON mi_zip_city TO report;
GRANT SELECT ON mi_zip_county TO report;
GRANT SELECT ON mk_mkt_spd TO report;
GRANT SELECT ON mpo_nhd_geo TO report;
GRANT SELECT ON mpo_nhd_nam TO report;
GRANT SELECT ON mpo_nhd_zip TO report;
GRANT SELECT ON mpo_zip_bnd TO report;
GRANT SELECT ON mpo_zip_cnt TO report;
GRANT SELECT ON ms_mag_lst TO report;
GRANT SELECT ON ms_mag_lst_itm TO report;
GRANT SELECT ON msg_cnv TO report;
GRANT SELECT ON msg_cnv_ptp TO report;
GRANT SELECT ON msg_com TO report;
GRANT SELECT ON msg_com_inb TO report;
GRANT SELECT ON msg_com_med TO report;
GRANT SELECT ON msg_com_otb TO report;
GRANT SELECT ON msg_com_rcp TO report;
GRANT SELECT ON msg_gtw_nbr TO report;
GRANT SELECT ON msg_gtw_rte TO report;
GRANT SELECT ON ord_inv_amt TO report;
GRANT SELECT ON ord_tgt_mth TO report;
GRANT SELECT ON os_act_avl TO report;
GRANT SELECT ON os_act_avl_rsp TO report;
GRANT SELECT ON os_cst_ord TO report;
GRANT SELECT ON os_cst_ord_hst TO report;
GRANT SELECT ON os_cst_ord_itm TO report;
GRANT SELECT ON os_cst_ref TO report;
GRANT SELECT ON os_prd_rsn TO report;
GRANT SELECT ON os_ptl_ord TO report;
GRANT SELECT ON os_ptl_ord_hst TO report;
GRANT SELECT ON os_ptl_ord_prv_asn TO report;
GRANT SELECT ON os_srv_trk TO report;
GRANT SELECT ON sales_calls TO report;
GRANT SELECT ON series_back TO report;
GRANT SELECT ON service_providers TO report;
GRANT SELECT ON sf_prv_obd TO report;
GRANT SELECT ON shp_expt TO report;
GRANT SELECT ON shp_prv_trd TO report;
GRANT SELECT ON shp_srv TO report;
GRANT SELECT ON shp_srv_ptp TO report;
GRANT SELECT ON shp_srv_ptp_rsp TO report;
GRANT SELECT ON shp_srv_qst TO report;
GRANT SELECT ON shp_srv_qst_opt TO report;
GRANT SELECT ON shp_srv_qst_sec TO report;
GRANT SELECT ON shp_srv_rsp_alr TO report;
GRANT SELECT ON shp_srv_srv_qst TO report;
GRANT SELECT ON shp_srv_stt TO report;
GRANT SELECT ON shp_srv_svn TO report;
GRANT SELECT ON shp_svc_prv_con TO report;
GRANT SELECT ON shp_svc_prv_crw TO report;
GRANT SELECT ON shp_svc_prv_cst TO report;
GRANT SELECT ON shp_svc_prv_cvg TO report;
GRANT SELECT ON shp_svc_prv_expt TO report;
GRANT SELECT ON shp_svc_prv_map TO report;
GRANT SELECT ON ss_mag_lst_met TO report;
GRANT SELECT ON ss_mtc_tag_met TO report;
GRANT SELECT ON ss_reg_met TO report;
GRANT SELECT ON ss_sku_sum_met TO report;
GRANT SELECT ON sync_test TO report;
GRANT SELECT ON test_data TO report;
GRANT SELECT ON time_cal_mth TO report;
GRANT SELECT ON time_cal_qtr TO report;
GRANT SELECT ON time_cal_year TO report;
GRANT SELECT ON time_day TO report;
GRANT SELECT ON time_day_base TO report;
GRANT SELECT ON time_iso_week TO report;
GRANT SELECT ON time_iso_year TO report;
GRANT SELECT ON wa_sos_ubi TO report;
GRANT SELECT ON wf_tds TO report;
GRANT SELECT ON wf_wrk_itm TO report;
GRANT SELECT ON wf_wrk_itm_act TO report;
GRANT SELECT ON wf_wrk_itm_act_trn TO report;
GRANT SELECT ON wf_wrk_itm_sta TO report;
GRANT SELECT ON wf_wrk_itm_sts_sla TO report;
GRANT SELECT ON wf_wrk_itm_tds TO report;
GRANT SELECT ON wf_wrk_itm_typ_wrk_itm_sts TO report;
GRANT SELECT ON all_booking_times TO report;
GRANT SELECT ON booking_pct_inc TO report;
GRANT SELECT ON ca_sku_trd TO report;
GRANT SELECT ON inv_wip TO report;
GRANT SELECT ON iso_18_weeks_back TO report;
GRANT SELECT ON lb_att_agg TO report;
GRANT SELECT ON mpo_zip TO report;
GRANT SELECT ON ms_mag_lst_itm_gesv TO report;
GRANT SELECT ON ord_ann_sts TO report;
GRANT SELECT ON ord_day_sts TO report;
GRANT SELECT ON ord_eow_sts TO report;
GRANT SELECT ON ord_itm_gesv TO report;
GRANT SELECT ON ord_mth_sts TO report;
GRANT SELECT ON ord_qtr_sts TO report;
GRANT SELECT ON os_cst_ord_hst_chg TO report;
GRANT SELECT ON os_cst_ord_trn TO report;
GRANT SELECT ON os_cst_ref_itm_gesv TO report;
GRANT SELECT ON os_ptl_ord_itm_gesv TO report;

