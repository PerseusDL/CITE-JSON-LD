require 'faker'
class Generator
  # Random lower-case string n letters long
  def rstring( n )
    ('a'..'z').to_a.shuffle[0,n].join
  end
  
  # Random integer between a and b
  def rint( a=1, b=100 )
    rand(a..b)
  end
  
  # Random float between a and b
  def rfloat( a=0, b=1, n=4 )
    ndig( rand()*(b-a)+a, n )
  end
  
  # Trim float (f) to n digits
  def ndig( f, n )
    Float( "%.#{n}g" % f )
  end
   
  # Array of random strings of length n 
  # where n is between a and b
  def rawords( a, b )
    n = rint( a, b )
    words = []
    n.times do
      words.push Faker::Internet.domain_word
    end
    words
  end
   
  # Array of random urls of length n 
  # where n is between a and b
  def raurls( a, b )
    n = rint( a, b )
    urls = []
    n.times do
      urls.push Faker::Internet.url
    end
    urls
  end
end