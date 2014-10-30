# JSON-LD CITE collection templating tutorial

Welcome!
I'll give you a quick run-down of how to write a CITE collection JSON-LD template.
I'll show you how to use a small subset of JSON-LD's features.

A JSON data-structure can be turned into JSON-LD relatively easily...
Here's essentially what you'll have to add...

	{
		"@id": "urn:cite:namespace:collection.1"
		"@context": {}
	}

Let me explain how they work.

## "@context"

@context is where you define your verbs, node prefixes, and object datatypes.

		"cust": "http://github.com/caesarfeta/JackSON/blob/master/docs/SCHEMA.md#",

The default datatype is a string literal.
Use @type to specify a new datatype.

		"created_at": {
			"@id": "cust:createdAt",
			"@type": "xsd:dateTime"
		},

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

@type

## Make your
