# JSON-LD & linked-data application development

Welcome!
I'll give you a quick run-down of how to write JSON-LD templates, which will provide you with a solid foundation for building a linked-data application.
Then I'll show you how to build a prototype application.

## Why use JSON-LD?
Converting JSON to JSON-LD is worthwhile for one simple reason.

1. It forces you to give your data universal identifiers, which aids with citation and peer review.

Once your data has unique universal identifiers, you'll be able to use some fantastic tools to publish it.  These same tools are also a great way for everyone to search and analyze your data, yourself included.

## Prerequisites
I'm assuming you have working knowledge of JSON and RDF, and that you know what JSON-LD basically is, but you don't have much experience using it.
I throw around the words graph, node, edge, SPARQL, and Turtle.
If you don't know what those mean in the context of linked-data you will be very confused if you keep reading.

## The process
Here's a quick synopsis of what's covered in this tutorial.

1. Data Model
	1. Model data in JSON
	2. Convert JSON into JSON-LD
		1. Test with static data
		2. Test with dynamic fake data
2. API
	1. General Design
	2. Write data validators
	3. Document API with RAML

<!--
3. User Interface
	1. Integrate templates
	2. Interface testing
4. Launch
	1. Estimate running costs
	2. Launch!
	3. Publish
	4. Promote
	5. Gather feedback
-->

Let's go!

## Model data in JSON
First step is to model your data in JSON.
I'm going to assume you've done this before.
You probably have some JSON files lying around.

Here's my example JSON.

	{
		id: 2,
		urn: "urn:cite:perseus:author.1.1",
		authority_name: "Anacreontea",
		canonical_id: "",
		mads_file: "PrimaryAuthors/A/Anacreontea/n83-015406.mads.xml",
		alt_ids: [],
		related_works: "tlg4150.tlg001",
		urn_status: "published",
		redirect_to: "",
		created_by: "feed_aggregator",
		edited_by: "",
		created_at: null,
		updated_at: null
	}

This is a sample CITE Collections author record, 
like the ones used to populate the Perseus Catalog.
Its structure is very simple, which makes it a good foundation to teach you how to...

## Convert JSON into JSON-LD
I'll show you how to use a small subset of JSON-LD's features to convert JSON into valid JSON-LD.

Here's an author record converted to JSON-LD

	{
		"@context": {
			"urn": "http://www.homermultitext.org/cts/rdf#urn:",
			"rdf": "http://perseus.org/rdf/",
			"service": "http://perseus.org/service/",
			"status": "http://perseus.org/status/",
			"user": "http://perseus.org/user/",
			"edited_by": { "@id": "rdf:editedBy" },
			"created_by": { "@id": "rdf:createdBy" },
			"urn_status": { "@id": "rdf:urnStatus" },
			"canonical_id": { "@id": "rdf:canonicalId" },
			"alt_ids": { "@id": "rdf:altIds" },
			"authority_name": { "@id": "rdf:authorityName" },
			"mads_file": { "@id": "rdf:madsFile" },
			"redirect_to": { "@id": "rdf:redirectTo" },
			"created_at": {
				"@id": "rdf:createdAt",
				"@type": "xsd:dateTime"
			},
			"updated_at": {
				"@id": "rdf:updatedAt",
				"@type": "xsd:dateTime"
			}
		},
		"@id": "urn:cite:<%= data[:namespace] %>:<%= data[:collection] %>.1.1",
		"redirect_to": [
			{ "@id": "urn:cite:perseus:author.1.2" },
			{ "@id": "urn:cite:perseus:author.2.4" }
		],
		"urn_status": { "@id": "status:published" },
		"edited_by": { "@id": "user:adamt" },
	 	"created_by": { "@id": "service:feed_aggregator" },
		"canonical_id": { "@id": "urn:cite:perseus:author.1.1" },
		"created_at": "<%= data[:created_at] %>",
		"updated_at": "<%= data[:updated_at] %>",
		"related_works": [ "tlg4150.tlg001" ],
		"alt_ids": [ "tlg1818x01", "tlg2020x02" ],
		"authority_name": "Anacreontea",
		"mads_file": "PrimaryAuthors/A/Anacreontea/n83-015406.mads.xml"
	}

You've probably noticed the presence of 

	"@id"

and

	"@context"

They're essential to how JSON-LD works, 
so let me explain them in a bit more detail.

# "@id"
"@id" is always used to define an IRI.
If IRI is a new acronym for you [http://en.wikipedia.org/wiki/Internationalized_resource_identifier](read this.)
It won't take long ;) 
If you've seen RDF in Turtle (.ttl) format...

	<urn:cite:perseus:collection.1> | <http://perseus.org/rdf/updatedAt> | "2013-11-01 21:22:11 -0400"^^<xsd:dateTime>

then you've seen an IRI.
An IRI is anything between...

	<>

Colons in an "@id" value have special properties in JSON-LD.
A colon signifies you're using a prefix representation of an absolute IRI and therefore your value needs to be expanded. For example when using SPARQL.

	PREFIX rdf: <http://perseus.org/rdf/>
	<rdf:updatedAt>

will be expanded into...

	<http://perseus.org/rdf/updatedAt>

JSON-LD doesn't use PREFIX.
It uses...

## "@context"

"@context" is where you define your verbs, prefixes, and object datatypes, 
and it's where JSON keys are mapped to RDF verbs.

Here's a prefix.

	"@context": {
		"rdf": "http://perseus.org/rdf/"
	}

This defines an RDF verb `<http://perseus.org/rdf/editedBy>` and maps it to the `"edited_by"` JSON key

	"@context": {
		"rdf": "http://perseus.org/rdf/",
		"edited_by": { "@id": "rdf:editedBy" }
	}

This does the same as above but also specifies the object node's datatype as "xsd:dateTime".

	"@context": {
		"rdf": "http://perseus.org/rdf/",
		"created_at": {
			"@id": "rdf:createdAt",
			"@type": "xsd:dateTime"
		},
	}

The default datatype is a string literal.
"@type" will specify a new datatype, 
so later on in the JSON-LD document where your actual data values are set,
this key value pair... 

	"created_at": "2014-05-28 01:05:15 -0400"

will be tranformed to this RDF...

	<http://perseus.org/rdf/createdAt> "2014-05-28 01:05:15 -0400"^^<xsd:dateTime>

## The many faces of "@id"
"@id" does different things depending on its location in the JSON-LD object.
You've already seen it used in @context to map a JSON key to an RDF verb.
But it also serves two other purposes.

"@id" in the object root defines the subject node IRI.
"@id" in a key-value pair defines an object node IRI.


## Testing with static data
## Testing with dynamic fake data

## Best practices
Here's how I like to structure my JSON-LD files.
I find it makes it easier to check my work,
and it makes templating easier...
"@context" objects can be reused across templates, etc.

	{
		"@context": {
			PREFIXES
			MAPPINGS
				TO ARRAY URN
				TO URN
				TO ARRAY TYPED
				TO TYPED
				TO ARRAY STRING LITERAL
				TO STRING LITERAL
		},
		"@id": "urn",
		KEYS in same order as MAPPINGS
	}