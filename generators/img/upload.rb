require 'faker'
require 'date'
require_relative '../fake_filetype.rb'
require_relative '../fake_user.rb'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :id => Generator.rid(11),
  :namespace => 'perseus',
  :collection => Faker::Internet.domain_word,
  :width => Generator.rint(250,1000),
  :height => Generator.rint(250,1000),
  :filetype => FakeFiletype.get,
  :src => Faker::Internet.url,
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}