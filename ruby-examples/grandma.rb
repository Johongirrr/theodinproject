
byes_counter = []

while byes_counter
  puts "Say something to the old lady."
  input = gets.chomp

  if input.upcase == "BYE"
    byes_counter << "bye"
    if byes_counter.length > 2
      break
    end
  end

  if input.upcase == input
    puts "NO, NOT SINCE 1930!"
  elsif
    puts "HUH?!  SPEAK UP, SONNY!"
  end

end