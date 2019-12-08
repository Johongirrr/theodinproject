
wl = 25
wr = 15
puts "Table of Contents".center(50)
puts "Chapter 1:  Numbers".ljust(wl) + "page 1".rjust(wr)
puts "Chapter 2:  Letters".ljust(wl) + "page 12".rjust(wr)
puts "Chapter 3:  Variables".ljust(wl) + "page 123".rjust(wr)

puts "#{365*24} hours in a year"
puts "#{10*365*24*60} minutes are in a decade"
puts "#{26*365*24*60*60} seconds old are you"
puts "#{1298000000/60/60/24/365} years old"
puts "first name?"
firstname = gets.chomp
puts "middle name?"
middlename = gets.chomp
puts "last name?"
lastname = gets.chomp

puts "hello #{firstname} #{middlename} #{lastname}"

puts "favorite number?"
n = gets.chomp
n = n.to_i + 1
puts "nah, #{n} is better"

