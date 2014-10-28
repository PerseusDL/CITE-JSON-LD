require "uri"
puts URI.extract( File.read( ARGV[0] ), /http(s)?/ ).uniq!.sort!