OPTIONS (SKIP=1, DIRECT=TRUE)
LOAD DATA
INFILE 'sample.tsv'
TRUNCATE INTO TABLE sample
FIELDS TERMINATED BY '\t'
(
  icgc_sample_id,
  project_code,
  submitted_sample_id,
  icgc_specimen_id,
  submitted_specimen_id,
  icgc_donor_id,
  submitted_donor_id,
  analyzed_sample_interval,
  percentage_cellularity,
  level_of_cellularity
)
