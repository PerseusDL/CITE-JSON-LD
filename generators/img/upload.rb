require 'faker'
require 'date'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :namespace => Faker::Internet.domain_word,
  :collection => Faker::Internet.domain_word,
  :label => Faker::Lorem.word,
  :description => Faker::Lorem.sentence,
  :img => Generator.rint(0,100),
  :x => Generator.rfloat(0.1,1),
  :y => Generator.rfloat(0.1,1),
  :width => Generator.rfloat(0.1,1),
  :height => Generator.rfloat(0.1,1),
  :app => Faker::Internet.url,
  :lang => Faker::Internet.domain_word,
  :user => Faker::Internet.user_name,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}