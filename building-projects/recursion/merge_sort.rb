def merge_sort(els)
  if els.length < 2
    return els
  end
  merged = []
  n = els.length/2
  left = merge_sort(els[0...n])
  right = merge_sort(els[n..-1])
  until left.empty? || right.empty?
    left[0] < right[0] ? merged.push(left.shift) : merged.push(right.shift)
  end
  merged + left + right
end

p merge_sort([4, 8, 6, 2, 1, 7, 5, 3])