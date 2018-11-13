OPTIONS (DIRECT=TRUE)
LOAD DATA
INFILE 'r2rml.nt'
TRUNCATE INTO TABLE r2rml
when (1) <> '#'
(
  rdf$stc_sub  CHAR(4000) terminated by whitespace
, rdf$stc_pred CHAR(4000) terminated by whitespace
, rdf$stc_obj  CHAR(5000) "rtrim(:RDF$STC_obj,'. '||CHR(9)||CHR(10)||CHR(13))"
)
