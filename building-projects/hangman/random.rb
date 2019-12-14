require_relative 'game'

game = Game.new('5desk.txt')
game.run()

MAX = 5
MIN = 5
ROUNDS = 6
def clean_word(word)
  word.gsub!(/\r\n/, '')
end

def hint(secret, answer)
  result = ''
  0.upto(secret.length-1) do |i|
    if secret[i] == answer
      result += secret[i]
    elsif
      result += '-'
    end
  end
  result
end
dictionary = File.readlines('5desk.txt')
dictionary.each {|word| clean_word(word)}
game_words = dictionary.select{|word| word.length <= MAX && word.length >= MIN}
secret = random_word(game_words)




