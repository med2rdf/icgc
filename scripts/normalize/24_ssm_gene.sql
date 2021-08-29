DROP TABLE ssm_gene;
CREATE TABLE ssm_gene AS
SELECT DISTINCT
, gene_affected AS gene_id
FROM ssm
;
SELECT COUNT(*) FROM ssm_gene;
