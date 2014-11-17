require_relative 'generator'
class FakeImg
  @genre = [
    'sports',
    'food',
    'animals',
    'cats',
    'city',
    'people',
    'transport',
    'nightlife',
    'fashion'
  ]
  def self.get
#    "http://lorempixel.com/#{self.pixels()}/#{self.pixels()}/#{self.word()}/#{self.num()}"
    "http://placecage.com/#{self.pixels()}/#{self.pixels()}"
  end
  def self.pixels
    Generator.rint(6,12)*100
  end
  def self.num
    Generator.rint(1,25)
  end
  def self.word
    @genre[ Generator.rint(0,@genre.length-1)]
  end
end