OPTIONS (DIRECT=TRUE)
LOAD DATA
INFILE 'r2rml.nt'
TRUNCATE INTO TABLE r2rml
FIELDS TERMINATED BY ' '
(
  rdf$stc_sub
, rdf$stc_pred
, rdf$stc_obj
)
