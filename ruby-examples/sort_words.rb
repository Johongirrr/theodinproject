
words = []
puts "Add as many words as you want, leave it blank and hit Entry to exit."
while true
  word = gets.chomp
  if word.length == 0
    puts "Your sorted words are:"
    puts words.sort
    break
  elsif
    words.push(word)
  end
end