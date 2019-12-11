def bubble_sort(arr)
  length = arr.length - 1;
  for i in 0..length
    for j in 1..length-i
      if arr[j-1] > arr[j]
        arr[j], arr[j-1] = arr[j-1], arr[j]
      end    
    end  
  end 
  arr
end

def bubble_sort_by(arr)
  length = arr.length - 1;
  for i in 0..length
    for j in 1..length-i
      if yield(arr[j-1], arr[j]) > 0
        arr[j], arr[j-1] = arr[j-1], arr[j]
      end    
    end  
  end 
  arr
end
