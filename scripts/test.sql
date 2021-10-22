DELETE FROM DB.DBA.LOAD_LIST;
ld_dir ('/database/icgc/output', '<project_code>.nt.gz', 'https://icgc.link');
select * from DB.DBA.LOAD_LIST;
DB.DBA.rdf_loader_run ();
SPARQL SELECT CONCAT("COUNT <project_code> ", COUNT(*)) WHERE { graph <https://icgc.link> { ?s ?p ?o } };
SPARQL CLEAR GRAPH 'https://icgc.link';
EXIT;
