sqlplus icgc_user/oracle << EOF
@21_ssm_mutation.sql
@22_ssm_detection.sql
@23_ssm_effect.sql
EXIT
EOF
