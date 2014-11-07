require 'faker'
require_relative '../generator.rb'
require_relative '../json_id.rb'
require_relative '../fake_user.rb'
@data = {
  :upload => JsonId.get('/var/www/JackSON/data/upload'),
  :src => Faker::Internet.url,
  :filetype => FakeFiletype.get,
  :width => Generator.rint(250,1000),
  :height => Generator.rint(250,1000),
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}