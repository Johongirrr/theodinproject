require_relative '../tree'
require 'test/unit'

class TestTree < Test::Unit::TestCase
  def test_should_insert_the_new_node_in_the_correct_position
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    tree.insert(13)
    tree.insert(12)
    assert_equal(13, tree.root.left.right.right.data)
    assert_equal(12, tree.root.left.right.right.left.data)
  end

  def test_should_delete_the_first_node_found_that_match_the_given_value
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    tree.delete(4)
    assert_equal(5, tree.root.left.left.data)
    assert_equal(3, tree.root.left.left.left.data)
    tree.delete(23)
    assert_equal(67, tree.root.data)
    assert_equal(8, tree.root.left.data)
    assert_equal(6345, tree.root.right.data)
  end

  def test_found_method_should_return_the_found_node_or_nil
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal(4, tree.find(4).data)
    assert_equal(6345, tree.find(6345).data)
    # not found
    assert_equal(nil, tree.find(999))
  end

  def test_should_return_data_by_level_order
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal([23, 8, 67, 4, 9, 6345, 3, 5, 324, 1, 7], tree.level_order)
    result = tree.level_order{|node| node.data + 1}
    assert_equal([24, 9, 68, 5, 10, 6346, 4, 6, 325, 2, 8], result)
  end

  def test_build_tree_should_return_a_binary_tree
    root = Tree.build_tree([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_not_nil(root.left)
    assert_equal(23, root.data) 
    assert_equal(8, root.left.data)
    assert_equal(67, root.right.data)
    assert_equal(9, root.left.right.data)
    assert_equal(7, root.left.left.right.right.data)
    assert_equal(324, root.right.right.left.data)
  end

end

