BEGIN
  SEM_APIS.DROP_RDFVIEW_MODEL(
    MODEL_NAME => 'icgc_rdfview'
  );
END;
/

BEGIN
  SEM_APIS.create_rdfview_model(
    model_name => 'ICGC_RDFVIEW',
    tables => null,
    r2rml_table_owner => 'ICGC_USER',
    r2rml_table_name => 'R2RML'
  );
END;
/

--SELECT * FROM mdsys.sem_model$ WHERE model_type='D' ;

EXIT
