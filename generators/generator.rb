class Generator
  # Random lower-case string n letters long
  def rand_string( n )
    ('a'..'z').to_a.shuffle[0,n].join
  end
  
  # Random integer between a and b
  def rand_int( a, b )
    rand(a..b)
  end
end