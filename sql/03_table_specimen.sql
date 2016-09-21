DROP TABLE IF EXISTS specimen;
CREATE TABLE `specimen` (
  `icgc_specimen_id` varchar(255) DEFAULT NULL,
  `project_code` varchar(255) DEFAULT NULL,
  `study_specimen_involved_in` varchar(255) DEFAULT NULL,
  `submitted_specimen_id` varchar(255) DEFAULT NULL,
  `icgc_donor_id` varchar(255) DEFAULT NULL,
  `submitted_donor_id` varchar(255) DEFAULT NULL,
  `specimen_type` varchar(255) DEFAULT NULL,
  `specimen_type_other` varchar(255) DEFAULT NULL,
  `specimen_interval` varchar(255) DEFAULT NULL,
  `specimen_donor_treatment_type` varchar(255) DEFAULT NULL,
  `specimen_donor_treatment_type_other` varchar(255) DEFAULT NULL,
  `specimen_processing` varchar(255) DEFAULT NULL,
  `specimen_processing_other` varchar(255) DEFAULT NULL,
  `specimen_storage` varchar(255) DEFAULT NULL,
  `specimen_storage_other` varchar(255) DEFAULT NULL,
  `tumour_confirmed` varchar(255) DEFAULT NULL,
  `specimen_biobank` varchar(255) DEFAULT NULL,
  `specimen_biobank_id` varchar(255) DEFAULT NULL,
  `specimen_available` varchar(255) DEFAULT NULL,
  `tumour_histological_type` varchar(255) DEFAULT NULL,
  `tumour_grading_system` varchar(255) DEFAULT NULL,
  `tumour_grade` varchar(255) DEFAULT NULL,
  `tumour_grade_supplemental` varchar(255) DEFAULT NULL,
  `tumour_stage_system` varchar(255) DEFAULT NULL,
  `tumour_stage` varchar(255) DEFAULT NULL,
  `tumour_stage_supplemental` varchar(255) DEFAULT NULL,
  `digital_image_of_stained_section` varchar(255) DEFAULT NULL,
  `percentage_cellularity` int(10) DEFAULT NULL,
  `level_of_cellularity` varchar(255) DEFAULT NULL
);