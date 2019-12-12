class Book
  attr_accessor :title

  def title
    words = @title.split(' ')
    forbidden = ['the', 'a', 'an', 'and', 'or', 'in', 'of']
    words.each_with_index do |word, i|
      if i == 0
        words[i] = word.capitalize
      elsif !forbidden.include? word
        words[i] = word.capitalize
      else
        words[i] = word
      end
    end
    words.join(' ')
  end
end

