#write your code here
def echo(value)
  value
end

def shout(value)
  value.upcase
end

def repeat(word, n=2)
  ((word+' ') * n).strip()
end

def start_of_word(word, i)
  word.slice(0, i)
end

def first_word(text)
  text.split(" ").first
end

def titleize(text)
  forbidden = ['and', 'over', 'the']
  words = text.split(" ")
  result = []
  words.each_with_index do |word, index|
    if index == 0
      result.push(word.capitalize)
    elsif !forbidden.include?(word) 
      result.push(word.capitalize)
    else
      result.push(word)
    end
  end
  result.join(" ")
end