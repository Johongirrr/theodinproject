class Timer
  attr_accessor :seconds

  def seconds
    0
  end

  def format(n)
    (n < 10) ? '0'+n.to_s : n.to_s
  end
  
  def time_string
      hs = @seconds / 3600
      mins = (@seconds % 3600) / 60
      ss = (@seconds % 3600) % 60
      "#{format(hs)}:#{format(mins)}:#{format(ss)}"
  end

end
