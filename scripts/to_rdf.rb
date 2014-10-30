require 'rdf'
require 'json/ld'
require 'rdf/turtle'
input = JSON.parse(File.read( ARGV[0] ))
graph = RDF::Graph.new << JSON::LD::API.toRdf( input )
puts graph.dump( :ttl )