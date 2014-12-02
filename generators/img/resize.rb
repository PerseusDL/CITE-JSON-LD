require 'faker'
require_relative '../fake_filetype.rb'
require_relative '../fake_user.rb'
require_relative '../generator.rb'
require_relative '../json_id.rb'
@data = {
  :id => Generator.rid(11),
  :upload => JsonId.get('/var/www/JackSON/data/upload'),
  :namespace => "perseus",
  :src => Faker::Internet.url,
  :filetype => FakeFiletype.get,
  :width => Generator.rint(250,1000),
  :height => Generator.rint(250,1000),
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}