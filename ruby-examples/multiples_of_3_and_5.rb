multiples = []
1000.times do |i|
  if (i % 5) == 0 && (i % 3) == 0
    multiples.push(i)
  end
end
puts multiples.sum