# JSON-LD & linked-data application development

Welcome!
I'll give you a quick run-down of how to write and test JSON-LD templates, 
which will provide you with a solid foundation for building a linked-data application.

## Why use JSON-LD?
Converting JSON to JSON-LD is worthwhile for two simple reasons.

1. It forces you to give your data universal identifiers, which aids with citation and peer review.

	* Once your data has unique universal identifiers, you'll be able to use some fantastic tools to publish it.  These same tools are also a great way for everyone to search and analyze your data, yourself included.

2. It's still just JSON, which is, in my opinion, the easiest way to transfer data over HTTP and the easiest data format to generate on the client.

## Prerequisites
I'm assuming you have working knowledge of JSON and RDF, 
and that you know what JSON-LD basically is but you don't have much experience using it.

I throw around the words graph, node, edge, SPARQL, and Turtle.
If you don't know what those mean in the context of linked-data you will be very confused if you keep reading.

## The process
Here's a quick synopsis of what's covered in this tutorial.

1. Data Modelling
	1. Model data in JSON
	2. Convert JSON into JSON-LD
		1. Test with static data
		2. Test with dynamic fake data

Let's go!

# Data Modelling
## Model data in JSON
First step is to model your data in JSON.
I'm going to assume you've done this before.
You probably have some JSON files lying around.

Here's an example.

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
			"urn": "http://data.perseus.org/collections/urn:",
			"rdf": "http://perseus.org/rdf/",
			"service": "http://perseus.org/service/",
			"status": "http://perseus.org/status/",
			"user": "http://perseus.org/user/",
			"created_at": {
				"@id": "rdf:createdAt",
				"@type": "xsd:dateTime"
			},
			"updated_at": {
				"@id": "rdf:updatedAt",
				"@type": "xsd:dateTime"
			},
			"edited_by": { "@id": "rdf:editedBy" },
			"created_by": { "@id": "rdf:createdBy" },
			"urn_status": { "@id": "rdf:urnStatus" },
			"canonical_id": { "@id": "rdf:canonicalId" },
			"alt_ids": { "@id": "rdf:altIds" },
			"authority_name": { "@id": "rdf:authorityName" },
			"mads_file": { "@id": "rdf:madsFile" },
			"redirect_to": { "@id": "rdf:redirectTo" }
		},
		"@id": "urn:cite:perseus:author.1.1",
		"authority_name": "Anacreontea",
		"canonical_id": { "@id": "urn:cite:perseus:author.1.1" },
		"mads_file": "PrimaryAuthors/A/Anacreontea/n83-015406.mads.xml",
		"alt_ids": [ "tlg1818x01", "tlg2020x02" ],
		"redirect_to": [
			{ "@id": "urn:cite:perseus:author.1.2" },
			{ "@id": "urn:cite:perseus:author.2.4" }
		],
		"related_works": [ "tlg4150.tlg001" ],
		"urn_status": { "@id": "status:published" },
		"edited_by": { "@id": "user:adamt" },
	 	"created_by": { "@id": "service:feed_aggregator" },
		"created_at": "2014-01-28 11:44:53 -0500",
		"updated_at": "2013-11-01 21:22:11 -0400"
	}

You've probably noticed the presence of 

	"@id"

and

	"@context"

They're essential to how JSON-LD works, 
so let me explain them in a bit more detail.

#### "@id"
"@id" is always used to define an IRI.
If IRI is a new acronym for you [read this](http://en.wikipedia.org/wiki/Internationalized_resource_identifier).
It won't take long ;) 

If you've seen RDF in Turtle (.ttl) format...

	<urn:cite:perseus:collection.1> | <http://perseus.org/rdf/updatedAt> | "2013-11-01 21:22:11 -0400"^^<xsd:dateTime>

then you've seen an IRI.
An IRI is anything between...

	<>

Colons in an "@id" value have special properties in JSON-LD.
A colon signifies you're using a prefix representation of an absolute IRI and therefore your value needs to be expanded. 
For example when using SPARQL.

	PREFIX rdf: <http://perseus.org/rdf/>
	<rdf:updatedAt>

will be expanded into...

	<http://perseus.org/rdf/updatedAt>

JSON-LD doesn't use PREFIX it has something similar though...

#### "@context"

"@context" is where you define your verbs, prefixes, and object datatypes, 
and it's how JSON keys are mapped to RDF verbs.

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

	<http://perseus.org/rdf/createdAt> | "2014-05-28 01:05:15 -0400"^^<xsd:dateTime>

#### The many faces of "@id"
"@id" does different things depending on its location in the JSON-LD object.
You've already seen it used in @context to map a JSON key to an RDF verb.
But it also serves two other purposes...

1. "@id" in the object root defines the subject node IRI.
2. "@id" in a key-value pair defines an object node IRI.

Let's look at a concrete example...

	{
		"@context": {
			"urn": "http://data.perseus.org/collections/urn:",
			"rdf": "http://perseus.org/rdf/",
			"redirect_to": { "@id": "rdf:redirectTo" }
		},
		"@id": "urn:cite:perseus:author.1.1",
		"redirect_to": [
			{ "@id": "urn:cite:perseus:author.1.2" },
			{ "@id": "urn:cite:perseus:author.2.4" }
		]
	}

Here's the same data represented after being converted to RDF triples...

	<http://data.perseus.org/collections/urn:cite:perseus:author.1.1> | <http://perseus.org/rdf/redirectTo> | <http://data.perseus.org/collections/urn:cite:perseus:author.1.2>
	<http://data.perseus.org/collections/urn:cite:perseus:author.1.1> | <http://perseus.org/rdf/redirectTo> | <http://data.perseus.org/collections/urn:cite:perseus:author.2.4>

### CITE URNs, Relative IRIs and JSON-LD
`<http://data.perseus.org/collections/urn:cite:perseus:author.1.1>` is an absolute IRI.
`<urn:cite:perseus:author.1.1>` is a relative IRI.

JSON-LD supports both but using CITE URN style relative IRIs can be tricky, because of how they use :
If you'd prefer to see CITE URNs in a relative IRI style in your triplestore you can use [special features of JackRDF](https://github.com/caesarfeta/JackRDF) ( see section titled **CITE URNs and relative IRIs** ).

### Test with static data
Here's a quick and easy way of testing your JSON-LD.

	cd CITE-JSON-LD/scripts
	ruby to_rdf.rb /path/to/json-ld/static.json 

Once you are happy with the triples produced with static JSON-LD files,
you'll want to produce templates and generators to...

### Test with dynamic fake data and JackSON
[If all you need is a quick reference...](https://github.com/caesarfeta/JackSON/blob/master/docs/TEMPLATES.md).

You want fake data that is "realistic".
This means the fake data needs to have the right proportions, the right datatype, and reference itself properly.

Here's how I generate "realistic" fake data
( [JackRDF](https://github.com/caesarfeta/JackRDF) needs to be installed and its bundled Fuseki server must be running ).

I write JSON-LD templates using ERB and keep them in...

	/templates

I write fake-data generators and keep them in...

	/generators

I then use a JackSON rake task to create a specified amount of fake JSON-LD files.

	cd /var/www/JackSON
	rake data:fake['cite/templates/img/roi.json.erb','cite/generators/img/roi.rb',10000,'roi']

1. **cite/templates/img/roi.json.erb** is the templates path relative to .
2. **cite/generators/img/roi.rb** is the fake-data generator path relative to .
3. **10000** is the amount of fake-data JSON-LD files to create
4. **roi** is the path relative to ./data/

Here's an example template: **templates/img/collection.json.erb**

	{
		<%= File.read("#{settings["dir"]}/context.json.erb") %>,
		"@id": "<%= data[:collection_urn] %>.<%= data[:id] %>",
		"rdf:label": "<%= data[:label] %>",
		"rdf:description": "<%= data[:description] %>",
	 	"cite:belongsTo": { "@id": "<%= data[:collection_urn] %>" },
		"this:license": { "@id": "<%= data[:license] %>" },
		"this:upload": { "@id": "<%= data[:upload_urn] %>" },
		"this:keyword": <%= data[:keywords] %>,
		"user": { "@id": "user:<%= data[:user] %>" },
		"time": "<%= data[:time] %>"
	}

This line...

	<%= File.read("#{settings["dir"]}/context.json.erb") %>,

...pulls **templates/img/context.json.erb** into the template, which is where I define the RDF prefixes and datatypes shared by a group of JSON-LD templates.

It should look familiar...

	"@context": {
		"urn": "http://data.perseus.org/collections/urn:",
		"cite": "http://www.homermultitext.org/cite/rdf/",
		"rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
	    "exif": "http://www.kanzaki.com/ns/exif#",
		"this": "https://github.com/PerseusDL/CITE-JSON-LD/blob/master/templates/img/SCHEMA.md#",
		"user": "http://data.perseus.org/sosol/users/",
		"time": {
			"@id": "http://www.w3.org/TR/xmlschema11-2/#dateTime",
			"@type": "xsd:dateTime"
		},
		"roi_x": {
			"@id": "this:roi_x",
			"@type": "xs:float"
		},
		"roi_y": {
			"@id": "this:roi_y",
			"@type": "xs:float"
		},
		"roi_width": {
			"@id": "this:roi_width",
			"@type": "xs:float"
		},
		"roi_height": {
			"@id": "this:roi_height",
			"@type": "xs:float"
		},
		"ordered": {
			"@id": "cite:ordered",
			"@type": "xsd:Boolean"
		}
	}

Here's the associated data generator **generators/img/item.rb**

	require 'faker'
	require_relative '../generator.rb'
	require_relative '../json_id.rb'
	require_relative '../fake_user.rb'
	@data = {
	  :id => Generator.rid(11),
	  :label => Faker::Lorem.word.capitalize,
	  :description => Faker::Lorem.sentence,
	  :keywords => Generator.rawords(1,10),
	  :collection_urn => JsonId.get('/var/www/JackSON/data/collection'),
	  :upload_urn => JsonId.get('/var/www/JackSON/data/upload'),
	  :license => JsonId.get('/var/www/JackSON/data/license'),
	  :user => FakeUser.get,
	  :time => Faker::Time.between( Date.today-365, Time.now, :all )
	}

All it does is use some required classes to generate fake data.
It mostly uses a gem called [faker](https://github.com/stympy/faker), and some nearby custom classes.

There's one custom class I should explain, **JsonId**.
Here's a line where it's used.

	:collection_urn => JsonId.get('/var/www/JackSON/data/collection'),

It works by extracting an "@id" urn from a random JSON-LD file in the specified path.
So in...

	/var/www/JackSON/data/collection

I have these files...

	aut_culpa.json
	autem_est.json
	autem_fugit.json
	blanditiis_nemo.json
	consectetur_corporis.json
	consequatur_deleniti.json
	consequatur_voluptates.json
	cum_id.json

I pluck one out at random...

	blanditiis_nemo.json

...and I extract the value of the "@id" key in the root object:

	"@id": "urn:cite:perseus:wisozknienow"

I wrote this so my fake datasets can realistically reference themselves.

When data is self-referencing it means the sequence of data creation matters.
I can't create an item which references a collection before the collection exists.
I create a build script to make sure I get the sequence correct and save it with the templates I'm building:

	templates/img/fake.rb

It looks something like this:

	Dir.chdir("/var/www/JackSON")
	def fake templ,n
	  puts `rake data:fake['cite/templates/img/#{templ}.json.erb','cite/generators/img/#{templ}.rb',#{n},'#{templ}']`
	end 
	# How many do you need?
	n = 100
	# Build fake data
	fake 'license', 25
	fake 'collection', 50
	fake 'upload', n
	fake 'resize', n*5
	fake 'item', n
	fake 'roi', n*10
	# Build the triples
	puts `rake triple:make`

It just runs rake tasks in the right sequence.
Using a variable **n** and a coefficient allow me to create a dataset with the 'imagined realistic' proportions, and I can scale up my dataset for different testing purposes easily.

That's it!
Once the build script runs check in with Fuseki and see your fake dataset!

