DROP TABLE project;
CREATE TABLE project (
  project_code   VARCHAR2(255) DEFAULT NULL
, project_name   VARCHAR2(255) DEFAULT NULL
, primary_site   VARCHAR2(255) DEFAULT NULL
, tumour_type    VARCHAR2(255) DEFAULT NULL
, tumour_subtype VARCHAR2(255) DEFAULT NULL
, countries      VARCHAR2(255) DEFAULT NULL
);
