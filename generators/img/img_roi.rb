require 'faker'
require 'date'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :namespace => Faker::Internet.domain_word,
  :collection => Faker::Internet.domain_word,
  :label => Faker::Lorem.word,
  :description => Faker::Lorem.sentence,
  :img => gen.rint(0,100),
  :x => gen.rfloat(0.1,1),
  :y => gen.rfloat(0.1,1),
  :width => gen.rfloat(0.1,1),
  :height => gen.rfloat(0.1,1),
  :app => Faker::Internet.url,
  :lang => Faker::Internet.domain_word,
  :author => Faker::Internet.user_name,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}