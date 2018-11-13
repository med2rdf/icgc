OPTIONS (SKIP=1, DIRECT=TRUE)
LOAD DATA
INFILE 'ssm.tsv'
TRUNCATE INTO TABLE ssm
FIELDS TERMINATED BY '\t'
(
  icgc_mutation_id
, icgc_donor_id
, project_code
, icgc_specimen_id
, icgc_sample_id
, matched_icgc_sample_id
, submitted_sample_id
, submitted_matched_sample_id
, chromosome
, chromosome_start
, chromosome_end
, chromosome_strand
, assembly_version
, mutation_type
, reference_genome_allele
, mutated_from_allele
, mutated_to_allele
, quality_score
, probability
, total_read_count
, mutant_allele_read_count
, verification_status
, verification_platform
, biological_validation_status
, biological_validation_platform
, consequence_type
, aa_mutation
, cds_mutation
, gene_affected
, transcript_affected
, gene_build_version
, platform
, experimental_protocol
, sequencing_strategy
, base_calling_algorithm
, alignment_algorithm
, variation_calling_algorithm
, other_analysis_algorithm
, seq_coverage
, raw_data_repository
, raw_data_accession
--, initial_data_release_date
)
