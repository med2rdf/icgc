DROP TABLE donor;
CREATE TABLE donor (
  donor_id VARCHAR2(255) NOT NULL, -- icgc_donor_id
  project_code VARCHAR2(255) DEFAULT NULL,
  study_donor_involved_in VARCHAR2(255) DEFAULT NULL,
  submitted_donor_id VARCHAR2(255) DEFAULT NULL,
  donor_sex VARCHAR2(255) DEFAULT NULL,
  donor_vital_status VARCHAR2(255) DEFAULT NULL,
  disease_status_last_followup VARCHAR2(255) DEFAULT NULL,
  donor_relapse_type VARCHAR2(255) DEFAULT NULL,
  donor_age_at_diagnosis NUMBER(10) DEFAULT NULL,
  donor_age_at_enrollment NUMBER(10) DEFAULT NULL,
  donor_age_at_last_followup NUMBER(10) DEFAULT NULL,
  donor_relapse_interval NUMBER(10) DEFAULT NULL,
  donor_diagnosis_icd10 VARCHAR2(255) DEFAULT NULL,
  donor_tumour_staging_system_at_diagnosis VARCHAR2(255) DEFAULT NULL,
  donor_tumour_stage_at_diagnosis VARCHAR2(255) DEFAULT NULL,
  donor_tumour_stage_at_diagnosis_supplemental VARCHAR2(255) DEFAULT NULL,
  donor_survival_time NUMBER(10) DEFAULT NULL,
  donor_interval_of_last_followup NUMBER(10) DEFAULT NULL,
  prior_malignancy VARCHAR2(255) DEFAULT NULL,
  cancer_type_prior_malignancy VARCHAR2(255) DEFAULT NULL,
  cancer_history_first_degree_relative VARCHAR2(255) DEFAULT NULL
);
