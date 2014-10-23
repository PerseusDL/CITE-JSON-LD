CITE-JSON-LD
============

### JSON-LD templates that implement the CITE Collection protocol

* **/templates**
	* stores working JSON-LD templates
* **/samples**
	* for inspiration purposes
	* **/samples/json**
		* stores example CITE Collection data represented in JSON-LD or regular JSON.
	* **/samples/other**
		* stores example CITE Collection data represented in other flat-file formats.

### Useful links:

* [Perseus CITE Collection Capabilities Files](https://github.com/PerseusDL/cite_collections/tree/master/src/capabilities)

* [Homer Multitext Project: An overview CITE Collection Objects](http://www.homermultitext.org/hmt-doc/cite/)

* [The Homer Multitext and RDF-Based Integration](http://dlib.nyu.edu/awdl/isaw/isaw-papers/7/blackwell-smith/)

* [CITE Collections, Annotations, Triples and Named Graphs](http://folio.furman.edu/projects/cite/four_urls.html)

### Template standards
Use ERB notation in templates

	{
		"urn": <%= urn %>,
		...
	}

Its variable delimiters are not typically found in JSON,
which will make any template conversion scripts easier to write.

	<%= val %> => {{ val }}

is easier to convert than the inverse...

	{{ val }} => <%= val %>
