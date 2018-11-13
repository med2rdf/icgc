-- donor_sex

SELECT o
FROM TABLE(SEM_MATCH(
   'PREFIX icgc: <http://icgc.link/vocab/>
    SELECT DISTINCT ?o WHERE {?s icgc:donor_sex ?o}'
  , SEM_MODELS('ICGC_RDFVIEW')
  , null, null, null)
);

