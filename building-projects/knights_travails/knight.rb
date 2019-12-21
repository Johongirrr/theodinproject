require_relative './node'
def valid_move?(move, row, column)
  return (move[0] + row) > -1 && (move[0] + row) < 8 &&  
         (move[1] + column) > -1 && (move[1] + column) < 8 
end 
def knight_moves(start, finish)
  moves = [[1,2],[2,-1],[2,1],[1,-2],[-2,1],[-2,-1],[-1, 2],[-1,-2]]
  root = Node.new(start)
  q = [root]
  path = []
  while not q.empty? && path.empty?
    pn = q.shift
    moves.each do |move|
      if valid_move?(move, pn.data[0], pn.data[1])
        data = [pn.data[0]+move[0], pn.data[1]+move[1]]
        child = Node.new(data, pn)
        pn.children.push(child)
        q.push(child)
        if pn.data == finish
          while pn != nil
            path.push(pn.data)
            pn = pn.parent
          end
          return path.reverse
        end
      end
    end
  end
end