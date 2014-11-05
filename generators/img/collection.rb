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
  :img_urns => gen.rawords(1,10),
  :user => Faker::Internet.user_name,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}