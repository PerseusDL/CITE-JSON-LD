Dir.chdir("/var/www/JackSON")
def fake templ,n
  puts `rake data:fake['cite/templates/img/#{templ}.json.erb','cite/generators/img/#{templ}.rb',#{n},'#{templ}']`
end 
# How many do you need?
n = 1000
# Build fake data
fake 'license', 25
fake 'collection', 50
fake 'upload', n
fake 'resize', n*5
fake 'item', n
fake 'roi', n*10
# Build the triples
puts `rake triple:make`