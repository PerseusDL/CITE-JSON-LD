require 'faker'
require_relative '../fake_filetype.rb'
require_relative '../fake_user.rb'
require_relative '../fake_img.rb'
require_relative '../generator.rb'
@data = {
  :id => Generator.rid(11),
  :namespace => 'perseus',
  :collection => Faker::Internet.domain_word,
  :label => Faker::Lorem.word.capitalize,
  :description => Faker::Lorem.sentence,
  :keywords => Generator.rawords(1,10),
  :width => Generator.rint(250,1000),
  :height => Generator.rint(250,1000),
  :filetype => FakeFiletype.get,
  :src => FakeImg.get,
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}