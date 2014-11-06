require_relative 'generator'
require 'json'

class JsonId
  
  # Retrieve an @id from a random JSON-LD file in path
  def self.get path
    files = Dir.entries(path)
    clean = []
    files.each do |file|
      clean.push( file ) if /\.json$/.match file
    end
    file = clean[Generator.rint(0,clean.length-1)]
    json = JSON.parse(File.read("#{path}/#{file}"))
    json['@id']
  end
  
end