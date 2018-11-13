OPTIONS (SKIP=1, DIRECT=TRUE) 
LOAD DATA
INFILE 'donor.tsv'
TRUNCATE INTO TABLE donor
FIELDS TERMINATED BY '\t'
(
  donor_id
, project_code
, study_donor_involved_in
, submitted_donor_id
, donor_sex
, donor_vital_status
, disease_status_last_followup
, donor_relapse_type
, donor_age_at_diagnosis
, donor_age_at_enrollment
, donor_age_at_last_followup
, donor_relapse_interval
, donor_diagnosis_icd10
, donor_tumour_staging_system_at_diagnosis
, donor_tumour_stage_at_diagnosis
, donor_tumour_stage_at_diagnosis_supplemental
, donor_survival_time
, donor_interval_of_last_followup
, prior_malignancy
, cancer_type_prior_malignancy
, cancer_history_first_degree_relative
)
