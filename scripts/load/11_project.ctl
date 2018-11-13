OPTIONS (SKIP=1, DIRECT=TRUE)
LOAD DATA
INFILE 'project.tsv'
TRUNCATE INTO TABLE project
FIELDS TERMINATED BY '\t'
(
  project_code
, project_name
, primary_site
, tumour_type
, tumour_subtype
, countries
)
