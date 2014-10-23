CITE-JSON-LD
============
 JSON-LD templates that implement the CITE Collection protocol

## Directories explained

* **/templates**
	* stores working JSON-LD templates
* **/samples**
	* for inspiration purposes
	* **/samples/json**
		* stores example CITE Collection data represented in JSON-LD or regular JSON.
	* **/samples/other**
		* stores example CITE Collection data represented in other flat-file formats.

## Useful links

* [Perseus CITE Collection Capabilities Files](https://github.com/PerseusDL/cite_collections/tree/master/src/capabilities)

XML examples.

* [Index of /hmt/archival-publications](http://beta.hpcc.uh.edu/hmt/archival-publications/)

Archived zip files with plenty of XML examples.

* [Homer Multitext Project: An overview CITE Collection Objects](http://www.homermultitext.org/hmt-doc/cite/)

* [The Homer Multitext and RDF-Based Integration](http://dlib.nyu.edu/awdl/isaw/isaw-papers/7/blackwell-smith/)

* [HMT RDF vocabulary](http://www.homermultitext.org/hmt-doc/standards/rdfvocabulary.html)

* [CITE Collections, Annotations, Triples and Named Graphs](http://folio.furman.edu/projects/cite/four_urls.html)

## Template standards
Use ERB notation in templates

	{
		"urn": <%= urn %>,
	}

Its variable delimiters are not typically found in JSON,
which will make any template conversion scripts easier to write.

	<%= val %> => {{ val }}

is easier to convert than the inverse

	{{ val }} => <%= val %>

## scripts
Add scripts directory to your path.

	PATH="/var/www/CITE-JSON-LD/scripts:${PATH}"

### scripts/convert.rb
This script will convert ERB templates to other formats... after it is written...

### scripts/rdf_isolate.sh
Quick and dirty script for isolating unique predicate ontology definitions used in a .ttl document.
I can't guarantee completeness.

Use like so...

	rdf_isolate [source.ttl] [ontology-prefix]

example...

	rdf_isolate ~/Downloads/hmt.ttl cite
