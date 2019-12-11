def substrings(text, dictionary)
  text.downcase!
  result = {}
  text.split(' ').each do |word|
    dictionary.each do |substr|
      count = word.scan(/#{substr}/).length
      if count > 0
        if result[substr]
          result[substr] += 1
        else
          result[substr] = 1
        end
      end
    end
  end
  return result
end