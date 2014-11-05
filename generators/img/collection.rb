require 'faker'
require 'date'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :namespace => Faker::Internet.domain_word,
  :collection => Faker::Internet.domain_word,
  :label => Faker::Lorem.word,
  :description => Faker::Lorem.sentence,
  :keywords => gen.rawords(1,10),
  :order => gen.raurls(1,10),
  :user => Faker::Internet.user_name,
  :ordered => gen.rbool,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}
# rake data:fake['cite/templates/img/collection.json.erb','cite/generators/img/collection.rb',100,'collection']