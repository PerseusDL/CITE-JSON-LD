require 'faker'
require 'date'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :namespace => Faker::Internet.domain_word,
  :collection => Faker::Internet.domain_word,
  :created_at => Faker::Time.between( Date.today-365, Time.now, :all ),
  :updated_at => Faker::Time.between( Date.today-365, Time.now, :all )
}