require 'faker'
require 'date'
require_relative '../generator.rb'
gen = Generator.new
@data = {
  :created_at => Faker::Time.between( Date.today-365, Time.now, :all ),
  :updated_at => Faker::Time.between( Date.today-365, Time.now, :all )
}