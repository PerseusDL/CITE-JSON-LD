require 'faker'
require_relative '../generator.rb'
require_relative '../json_id.rb'
require_relative '../fake_user.rb'
@data = {
  :id => Generator.rid(11),
  :label => Faker::Lorem.word.capitalize,
  :description => Faker::Lorem.sentence,
  :keywords => Generator.rawords(1,10),
  :collection_urn => JsonId.get('/var/www/JackSON/data/collection'),
  :upload_urn => JsonId.get('/var/www/JackSON/data/upload'),
  :license => Faker::Lorem.word,
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}