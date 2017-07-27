DROP TABLE specimen;
CREATE TABLE specimen (
  icgc_specimen_id VARCHAR2(255) NOT NULL,
  project_code VARCHAR2(255) DEFAULT NULL,
  study_specimen_involved_in VARCHAR2(255) DEFAULT NULL,
  submitted_specimen_id VARCHAR2(255) DEFAULT NULL,
  icgc_donor_id VARCHAR2(255) DEFAULT NULL,
  submitted_donor_id VARCHAR2(255) DEFAULT NULL,
  specimen_type VARCHAR2(255) DEFAULT NULL,
  specimen_type_other VARCHAR2(255) DEFAULT NULL,
  specimen_interval VARCHAR2(255) DEFAULT NULL,
  specimen_donor_treatment_type VARCHAR2(255) DEFAULT NULL,
  specimen_donor_treatment_type_other VARCHAR2(255) DEFAULT NULL,
  specimen_processing VARCHAR2(255) DEFAULT NULL,
  specimen_processing_other VARCHAR2(255) DEFAULT NULL,
  specimen_storage VARCHAR2(255) DEFAULT NULL,
  specimen_storage_other VARCHAR2(255) DEFAULT NULL,
  tumour_confirmed VARCHAR2(255) DEFAULT NULL,
  specimen_biobank VARCHAR2(255) DEFAULT NULL,
  specimen_biobank_id VARCHAR2(255) DEFAULT NULL,
  specimen_available VARCHAR2(255) DEFAULT NULL,
  tumour_histological_type VARCHAR2(255) DEFAULT NULL,
  tumour_grading_system VARCHAR2(255) DEFAULT NULL,
  tumour_grade VARCHAR2(255) DEFAULT NULL,
  tumour_grade_supplemental VARCHAR2(255) DEFAULT NULL,
  tumour_stage_system VARCHAR2(255) DEFAULT NULL,
  tumour_stage VARCHAR2(255) DEFAULT NULL,
  tumour_stage_supplemental VARCHAR2(255) DEFAULT NULL,
  digital_image_of_stained_section VARCHAR2(255) DEFAULT NULL,
  percentage_cellularity NUMBER(10) DEFAULT NULL,
  level_of_cellularity VARCHAR2(255) DEFAULT NULL
);
