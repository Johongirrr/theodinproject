def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  arr.sum
end

def multiply(arr)
  result = 1
  arr.each do |num|
    result = result * num
  end
  result
end

def power(base, n)
  base ** n
end

def factorial(n)
  if n == 0 
    1
  else
    n * factorial(n-1)
  end
end