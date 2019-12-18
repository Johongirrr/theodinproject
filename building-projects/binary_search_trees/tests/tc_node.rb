require_relative '../node'
require 'test/unit'

class TestNode < Test::Unit::TestCase
  def test_node_should_have_a_data_left_and_right_attributes
    node = Node.new
    assert_nil(node.data)
    assert_nil(node.left)
    assert_nil(node.right)
  end
end

