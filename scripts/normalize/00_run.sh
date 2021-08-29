sqlplus icgc_user/oracle@xepdb1 << EOF
@21_ssm_mutation.sql
@22_ssm_detection.sql
@23_ssm_effect.sql
@24_ssm_gene.sql
EXIT
EOF
