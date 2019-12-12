#write your code here
def ftoc(f)
  if(f == 32)
    0
  end

  c = ((f - 32) * 5/9)
end

def ctof(c)
  if(c == 0)
    32
  end

  c = ((c * 9/5) + 32)
end

def ctof(c)
  if(c == 0)
    32
  end

  c = ((c * 9.0/5.0) + 32.0)
end