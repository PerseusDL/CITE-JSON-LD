CITE-JSON-LD
============
 JSON-LD templates that implement the CITE Collection protocol

### Directories explained

* **/templates**
	* stores working JSON-LD templates
* **/samples**
	* for inspiration purposes
	* **/samples/json**
		* stores example CITE Collection data represented in JSON-LD or regular JSON.
	* **/samples/other**
		* stores example CITE Collection data represented in other flat-file formats.

### Useful links

* [Perseus CITE Collection Capabilities Files](https://github.com/PerseusDL/cite_collections/tree/master/src/capabilities)

XML examples.

* [Index of /hmt/archival-publications](http://beta.hpcc.uh.edu/hmt/archival-publications/)

Archived zip files with plenty of XML examples.

* [Homer Multitext Project: An overview CITE Collection Objects](http://www.homermultitext.org/hmt-doc/cite/)

* [The Homer Multitext and RDF-Based Integration](http://dlib.nyu.edu/awdl/isaw/isaw-papers/7/blackwell-smith/)

* [HMT RDF vocabulary](http://www.homermultitext.org/hmt-doc/standards/rdfvocabulary.html)

* [CITE Collections, Annotations, Triples and Named Graphs](http://folio.furman.edu/projects/cite/four_urls.html)

### Template standards
Use ERB notation in templates

	{
		"urn": <%= urn %>,
	}

Its variable delimiters are not typically found in JSON,
which will make any template conversion scripts easier to write.

	<%= val %> => {{ val }}

is easier to convert than the inverse

	{{ val }} => <%= val %>

### Ontology prefixes in use

Take from [http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip](http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip) > *.ttl

	@prefix cts: 		<http://www.homermultitext.org/cts/rdf/>
	@prefix cite: 		<http://www.homermultitext.org/cite/rdf/>
	@prefix hmt:        <http://www.homermultitext.org/hmt/rdf/>
	@prefix citedata:   <http://www.homermultitext.org/hmt/citedata/>
	@prefix dcterms: 	<http://purl.org/dc/terms/>
	@prefix rdf: 		<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
	@prefix xsd: 		<http://www.w3.org/2001/XMLSchema#>
	@prefix olo:     	<http://purl.org/ontology/olo/core#>
	@prefix lex:        <http://data.perseus.org/rdfverbs/>
	@prefix pal: 		<http://shot.holycrossedu/rdfverbs/pal/>
	@prefix rdfs:   	<http://www.w3.org/2000/01/rdf-schema#>
	@prefix latepig: 	<http://shot.holycross.edu/rdf/latepig/>

### Ontology identifiers in use

Extracted from [http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip](http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip) > *.ttl using scripts/rdf_isolate.sh

#### cts
	cts:Edition
	cts:TextGroup
	cts:Translation
	cts:Work
	cts:abbreviatedBy
	cts:belongsTo
	cts:citationDepth
	cts:containedBy
	cts:contains
	cts:hasSequence
	cts:hasTextContent
	cts:lang
	cts:possesses
	cts:translationLang
	cts:xmlns

#### cite

### scripts/convert.rb
This script will convert ERB templates to other formats... after it is written...

### scripts/rdf_isolate.sh
