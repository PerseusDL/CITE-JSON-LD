require 'faker'
require_relative '../generator.rb'
require_relative '../json_id.rb'
require_relative '../fake_user.rb'
@data = {
  :item => JsonId.get('/var/www/JackSON/data/item'),
  :label => Faker::Lorem.word,
  :description => Faker::Lorem.sentence,
  :img => Generator.rint(0,100),
  :x => Generator.rfloat(0.1,1),
  :y => Generator.rfloat(0.1,1),
  :width => Generator.rfloat(0.1,1),
  :height => Generator.rfloat(0.1,1),
  :app => Faker::Internet.url,
  :lang => Faker::Internet.domain_word,
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}