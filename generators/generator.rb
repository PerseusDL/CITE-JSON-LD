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
end