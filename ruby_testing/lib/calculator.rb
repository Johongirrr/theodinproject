class Calculator
  def add(*args)
    return args.inject(0){|total, n| total + n }
  end
  def subtract(a, b)
    a - b
  end
end