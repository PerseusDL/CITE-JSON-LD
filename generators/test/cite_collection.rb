require 'faker'
@data = {
  :title => Faker::Company.name,
  :description => Faker::Hacker.say_something_smart,
  :urn => "urn:cite:perseus:#{Faker::Internet.user_name}",
  :name => Faker::Name.title,
  :class => Faker::Number.number(100),
  :namespace => {
    :abbr => Faker::Internet.domain_word,
    :full_value => "full_value"
  },
  :properties => [ "property1", "property2" ]
}