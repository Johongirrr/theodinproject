class Node
  attr_accessor :data, :parent, :children
  def initialize(data, parent = nil, children = [])
    @data = data
    @parent = parent
    @children = children
  end
end