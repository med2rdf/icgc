OPTIONS (SKIP=1, DIRECT=TRUE) 
LOAD DATA
INFILE 'specimen.tsv'
TRUNCATE INTO TABLE specimen
FIELDS TERMINATED BY '\t'
(
  icgc_specimen_id
, project_code
, study_specimen_involved_in
, submitted_specimen_id
, icgc_donor_id
, submitted_donor_id
, specimen_type
, specimen_type_other
, specimen_interval
, specimen_donor_treatment_type
, specimen_donor_treatment_type_other
, specimen_processing
, specimen_processing_other
, specimen_storage
, specimen_storage_other
, tumour_confirmed
, specimen_biobank
, specimen_biobank_id
, specimen_available
, tumour_histological_type
, tumour_grading_system
, tumour_grade
, tumour_grade_supplemental
, tumour_stage_system
, tumour_stage
, tumour_stage_supplemental
, digital_image_of_stained_section
, percentage_cellularity
--, level_of_cellularity
)
