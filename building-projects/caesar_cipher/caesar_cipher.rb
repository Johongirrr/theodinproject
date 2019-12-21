def alphabet?(letter)
  ord = letter.ord
  return (ord >= 65 && ord <= 90) || (ord >= 97 && ord <= 122)
end

def caesar_cipher(text, n)
  result = ''
  text.split('').each do |letter|
    pos = letter.ord+n
    if alphabet?(letter)
      result += alphabet?(pos.chr) ? pos.chr : (pos-26).chr
    else
      result += letter
    end
  end
  return result
end