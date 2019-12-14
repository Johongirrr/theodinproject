require 'json'
require 'date'
class Game
  MAX = 12
  MIN = 5
  ROUNDS = 6
  def initialize(file_path)
    @status = ''
    @words =  File.readlines(file_path)
    @words = clean_words(@words)
    @words = @words.select{|word| word.length <= MAX && word.length >= MIN}
  end
  
  def save_names
    Dir['saves/*'].join(', ').gsub('saves/', '').gsub('.json', '')
  end

  def save(data)
    t = DateTime.now
    File.open("saves/#{t.day}#{t.hour}#{t.minute}#{t.second}.json", 'w'){ |file| file.puts data.to_json}
  end

  def hint(secret, answer)
    if @status.length == 0 
      @status = '-'*secret.length
    end

    0.upto(secret.length-1) do |i|
      if secret[i] == answer 
        @status[i] = secret[i]
      end
    end
    @status
  end

  def secret_word
    @words[rand(0..@words.length-1)]
  end

  def clean_words(words)
    words.map { |word| word.gsub(/\r\n/, '') }
  end

  def run
    counter = 1
    answer = ''
    secret = self.secret_word
    rounds = secret.length + 3
    puts "Hint: this word is #{secret.length} length."
    while true
      puts "Round #{counter}/#{rounds}"
      @status = hint(secret, answer)
      puts "====> #{@status}"
      if secret == @status
        puts "You won"
        break
      end

      print "Please enter your guess letter:"
      answer = gets.chomp
      
      if answer == 'load'
        if Dir['saves/*'].length > 0
          puts "Please select one fo the following saves: #{save_names}"
          name = gets.chomp
          filename = 'saves/' + name + '.json'
          if File.exists?(filename)
            file = File.open(filename)
            data = JSON.load(file)
            @status = data['status']
            secret = data['secret']
            rounds = data['rounds']
            counter = data['counter']
            next
          else
            puts 'invalid name'
          end 
        else
          puts "There is no previous states saved."
          next
        end
      elsif answer == 'save'
        puts "saving game state..."
        data = {
          status: @status,
          secret: secret,
          rounds: rounds,
          counter: counter
        }
        save(data)
      end
      if counter >= rounds
        puts "Sorry, the game is over, the secret word is : #{secret}"
        break
      end
      counter += 1
    end
  end
end
