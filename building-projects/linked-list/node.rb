class Node
  attr_accessor :next_to, :value
  def initialize(value = nil, next_to = nil)
    @value = value
    @next_to = next_to
  end
end