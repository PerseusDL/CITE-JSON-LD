require 'faker'
class Generator
  # Random lower-case string n letters long
  def self.rstring( n )
    ('a'..'z').to_a.shuffle[0,n].join
  end
  
  # Random integer between a and b
  def self.rint( a=1, b=100 )
    rand(a..b)
  end
  
  # Random float between a and b
  def self.rfloat( a=0, b=1, n=4 )
    ndig( rand()*(b-a)+a, n )
  end
  
  # Random boolean value
  def self.rbool
    rand(2) == 1
  end
  
  # Trim float (f) to n digits
  def self.ndig( f, n )
    Float( "%.#{n}g" % f )
  end
   
  # Array of random strings of length n 
  # where n is between a and b
  def self.rawords( a, b )
    n = rint( a, b )
    words = []
    n.times do
      words.push Faker::Internet.domain_word
    end
    words
  end
   
  # Array of random urls of length n 
  # where n is between a and b
  def self.raurls( a, b )
    n = rint( a, b )
    urls = []
    n.times do
      urls.push Faker::Internet.url
    end
    urls
  end
  
  # Random alphanumeric id of length n
  def self.rid( n )
    s = ''
    n.times do
      l = rstring(1)
      l = l.upcase if rbool
      s = s+l
    end
    s
  end
  
end