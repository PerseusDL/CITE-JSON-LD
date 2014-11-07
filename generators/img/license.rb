require 'faker'
require_relative '../generator.rb'
require_relative '../json_id.rb'
require_relative '../fake_user.rb'
@data = {
  :id => Generator.rid(11),
  :namespace => 'perseus',
  :label => Faker::Lorem.word.capitalize,
  :description => Faker::Lorem.sentence,
  :user => FakeUser.get,
  :time => Faker::Time.between( Date.today-365, Time.now, :all )
}