DROP TABLE ssm_effect;
CREATE TABLE ssm_effect AS
SELECT DISTINCT
  icgc_mutation_id AS mutation_id
, consequence_type
, aa_mutation
, cds_mutation
, gene_affected
, transcript_affected
, gene_build_version
FROM ssm
;
-- ALTER TABLE ssm_effect ADD PRIMARY KEY (mutation_id, transcript_affected);
-- ALTER TABLE ssm_effect ADD FOREIGN KEY (mutation_id) REFERENCES ssm_mutation (mutation_id);
SELECT COUNT(*) FROM ssm_effect;
