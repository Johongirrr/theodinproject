

def fibs(n)
  sq = [0, 1] 
  2.upto(n) do |i|
   sq.push(sq[sq.length - 2] + sq.last) 
  end
  sq.last
end

def fibs_rec(n, fbs = [0, 1])
  n == 1 || n == 0 ? n : fibs_rec(n-1) + fibs_rec(n-2) 
end

p fibs(8)
p fibs_rec(8)
