require 'faker'
require 'date'
require_relative '../generator.rb'
require_relative '../fake_user.rb'
@data = {
  :type => 'collection',
  :namespace => 'perseus',
  :collection => Faker::Internet.domain_word,
  :label => Faker::Lorem.word.capitalize,
  :description => Faker::Lorem.sentence,
  :keywords => Generator.rawords(1,10),
  :order => Generator.raurls(1,10),
  :user => FakeUser.get,
  :ordered => Generator.rbool,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}