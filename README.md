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
* **/scripts**
	* handy scripts!
* **/generators**
	* test data generators

## Useful links

* [Perseus CITE Collection Capabilities Files](https://github.com/PerseusDL/cite_collections/tree/master/src/capabilities)

XML examples.

* [Index of /hmt/archival-publications](http://beta.hpcc.uh.edu/hmt/archival-publications/)

* [Perseus Myth Commentary Collection Item Example](http://data.perseus.org/collections/urn:cite:perseus:mythcomm.117.1/oac) (view the source to see the raw RDF/XML) - this is an example of a CITE collection item which contains an OA data field

Archived zip files with plenty of XML examples.

* [Homer Multitext Project: An overview CITE Collection Objects](http://www.homermultitext.org/hmt-doc/cite/)

* [The Homer Multitext and RDF-Based Integration](http://dlib.nyu.edu/awdl/isaw/isaw-papers/7/blackwell-smith/)

* [HMT RDF vocabulary](http://www.homermultitext.org/hmt-doc/standards/rdfvocabulary.html)

* [Four URLs, Limitless Apps: separation of concerns in the Homer Multitext architecture](http://folio.furman.edu/projects/cite/four_urls.html)
*
* [CITE Collections, Annotations, Triples and Named Graphs](https://docs.google.com/document/d/1765E-StEK-Fv0yjk05pprMVdaVW8F-oc8dl2T0yhj20/edit?usp=sharing)

Reference implementations.

 * [https://bitbucket.org/neelsmith/citefusioncoll](https://bitbucket.org/neelsmith/citefusioncoll) Groovy Servlet based implementation of the CITE Collection Service API which uses Google Fusion Tables as a back-end data store.

 * [https://bitbucket.org/ryanfb/cite-collection-editor](https://bitbucket.org/ryanfb/cite-collection-editor) Client-Side lightweight editor for CITE Collections stored in Google Fusion tables

 * [https://bitbucket.org/ryanfb/cite-collection-manager](https://bitbucket.org/ryanfb/cite-collection-manager) Proxy service for managing access to the Cite Collection Editor so that individual users don't need to be granted access to the Fusion Tables. Note that this is forked and updated for latest Google API code and to fix an auth timeout problem at [https://github.com/balmas/cite-collection-manager](https://github.com/balmas/cite-collection-manager)

## templates
 
Use ERB notation in templates

	{
		"urn": <%= urn %>
	}

Its variable delimiters are not typically found in JSON,
which will make any template conversion scripts easier to write.

	<%= val %> => {{ val }}

is easier to convert than, say...

	{{ val }} => <%= val %>

## generators
To use the fake data generators install [Faker](https://github.com/stympy/faker)

	gem install faker

## scripts
Add scripts directory to your path.

	PATH="/var/www/CITE-JSON-LD/scripts:${PATH}"

### scripts/convert.rb
This script will convert ERB templates to other formats... after it is written...

### scripts/rdf_isolate.sh
Isolate unique predicates used in a .ttl document.
I can't guarantee completeness.

Use like so...

	rdf_isolate [source.ttl] [ontology-prefix]

example...

	rdf_isolate ~/Downloads/hmt.ttl cite

## Testing
I've been using JackSON to test JSON-LD templates.
[My workflow](https://github.com/caesarfeta/JackSON/blob/master/docs/TEMPLATES.md).
