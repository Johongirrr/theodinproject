

def stock_picker(days)
  small_index = 0
  big_index = 0
  diff = 0
  count = days.length - 1
  result = []
  for i in 0..count
    for j in i..count
      if days[j] - days[i] > diff
        result = [i, j]
        diff = days[j] - days[i]
      end 
    end
  end
  return result
end