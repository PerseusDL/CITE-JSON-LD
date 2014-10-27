class Generator
  # Random lower-case string n letters long
  def rstring( n )
    ('a'..'z').to_a.shuffle[0,n].join
  end
  
  # Random integer between a and b
  def rint( a, b )
    rand(a..b)
  end
  
  # Random float between a and b
  def rfloat( a, b )
    rand()*(b-a)+a
  end
end