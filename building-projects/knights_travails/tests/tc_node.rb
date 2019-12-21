require_relative '../node'
require 'test/unit'

class TestNode < Test::Unit::TestCase
  def test_should_return_Node_instance
    node = Node.new([1, 5])
    assert_not_nil(node)
    assert_equal(node.data, [1, 5])
    assert_equal(node.children, [])
    assert_nil(node.parent)
  end
end