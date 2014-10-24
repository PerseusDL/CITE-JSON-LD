class Generator
  def rand_string( n )
    ('a'..'z').to_a.shuffle[0,n].join
  end
end