module Enumerable
  def my_each(arr)
    result = []
    length = arr.length-1
    for i in 0..length
      result.push(yield(arr[i]))
    end
    result
  end

  def my_each_with_index(arr)
    result = []
    length = arr.length-1
    for i in 0..length
      result.push(yield(arr[i], i))
    end
    result
  end

end
