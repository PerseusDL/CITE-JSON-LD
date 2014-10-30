# JSON-LD & linked-data application development

Welcome!
I'll give you a quick run-down of how to write JSON-LD templates, which will provide you with a solid foundation for building a linked-data application.

Then I'll show you how to build a prototype application.

## What is a linked-data application any way?
Why build a linked

## The process
Here's a quick synopsis of the process covered in this tutorial.

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

Here's the author record converted to JSON-LD

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
		"alt_ids": [ 
			"tlg1818x01", 
			"tlg2020x02" 
		],
		"authority_name": "Anacreontea",
		"mads_file": "PrimaryAuthors/A/Anacreontea/n83-015406.mads.xml"
	}

Here's what's different.
I've added two new keys to the root.

	{
		"@id": ""
		"@context": {}
	}

Let me explain how they work in a bit more detail.
They're basically what turn JSON into JSON-LD

## "@context"

@context is where you define your verbs, prefixes, and object datatypes.
If that doesn't make any sense read up on RDF.

Here's a prefix.

		"cust": "http://github.com/caesarfeta/JackSON/blob/master/docs/SCHEMA.md#",

This line defines a verb and the associated object data type.

		"created_at": {
			"@id": "cust:createdAt",
			"@type": "xsd:dateTime"
		},

The default datatype is a string literal.
Use @type to specify a new datatype.

@id specifies a node, in our cases it usually means a CITE URN or an Absolute IRI.
Colons in an @id value have special properties in JSON-LD.
A colon signifies you're using a prefix representation of an Absolute IRI.
So that means a key value pair in the JSON file... 

	"created_at": "2014-05-28 01:05:15 -0400"

will be expanded like this... ( this verb and object )... when converted to RDF

	<http://github.com/caesarfeta/JackSON/blob/master/docs/SCHEMA.md#updatedAt> "2014-05-28 01:05:15 -0400"^^<xsd:dateTime>

## CITE URNs & Relative IRIs

A CITE URN is a relative IRI, which is not the preferred way of defining a node.
It's a best practice to use global identifiers.

A CITE URN is a Relative IRI:

	<urn:cite:namespace:collection.1>

but Absolute IRIs, like this is preferred by idealists in the RDF working group:

	<http://www.homermultitext.org/cts/rdf#urn:cite:namespace:collection.1>


Colons in an @id value have special properties in JSON-LD.
A colon signifies you're using a short-representation of an IRI.
This can cause some confusion.

JackRDF does some extra things with the RDF created by the JSON-LD converter.
The changes are very simple and do not change the fundamentals of JSON-LD RDF conversion.

## preferred structure

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
