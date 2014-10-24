require_relative 'generator'
gen = Generator.new
@data = {
  :title => gen.rand_string(20),
  :description => "description",
  :urn => "urn",
  :name => "name",
  :class => "class",
  :namespace => {
    :abbr => "abbr",
    :full_value => "full_value"
  },
  :properties => [ "property1", "property2" ]
}