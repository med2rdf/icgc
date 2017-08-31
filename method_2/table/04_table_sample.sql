DROP TABLE sample;
CREATE TABLE sample (
  icgc_sample_id VARCHAR2(255) NOT NULL,
  project_code VARCHAR2(255) DEFAULT NULL,
  submitted_sample_id VARCHAR2(255) DEFAULT NULL,
  icgc_specimen_id VARCHAR2(255) DEFAULT NULL,
  submitted_specimen_id VARCHAR2(255) DEFAULT NULL,
  icgc_donor_id VARCHAR2(255) DEFAULT NULL,
  submitted_donor_id VARCHAR2(255) DEFAULT NULL,
  analyzed_sample_interval VARCHAR2(255) DEFAULT NULL,
  percentage_cellularity NUMBER(10) DEFAULT NULL,
  level_of_cellularity VARCHAR2(255) DEFAULT NULL
);
