require_relative '../tree'
require 'test/unit'

class TestTree < Test::Unit::TestCase
  def test_should_insert_the_new_node_in_the_correct_position
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    tree.insert(13)
    tree.insert(6)
    assert_equal(13, tree.root.right.right.left.data)
    assert_equal(6, tree.root.left.right.right.right.right.left.data)
  end

  def test_should_delete_the_first_node_found_that_match_the_given_value
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    tree.delete(4)
    assert_equal(8, tree.root.data)
    assert_equal(5, tree.root.left.right.right.data)
    assert_equal(3, tree.root.left.right.data)
    tree.delete(23)
    assert_equal(67, tree.root.right.right.data)
  end

  def test_found_method_should_return_the_found_node_or_nil
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal(4, tree.find(4).data)
    assert_equal(6345, tree.find(6345).data)
    assert_equal(nil, tree.find(999))
  end

  def test_build_tree_should_return_a_balanced_binary_tree
    root = Tree.build_tree([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_not_nil(root.left)
    assert_equal(8, root.data) 
    assert_equal(1, root.left.data)
    assert_equal(9, root.right.data)
  end

  def test_should_return_data_by_level_order
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal([8, 1, 9, 3, 23, 4, 67, 5, 324, 7, 6345], tree.level_order)
    result = tree.level_order{|node| node.data + 1}
    assert_equal([9, 2, 10, 4, 24, 5, 68, 6, 325, 8, 6346], result)
    
  end
  
  def test_preorder_method_should_return_data_in_depth_first_order
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal([8, 1, 3, 4, 5, 7, 9, 23, 67, 324, 6345], tree.preorder)
    result = tree.preorder{|node| node.data + 1}
    assert_equal([9, 2, 4, 5, 6, 8, 10, 24, 68, 325, 6346], result)
  end

  def test_inorder_method_should_return_data_in_depth_first_order
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal([1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345], tree.inorder)
    result = tree.inorder{|node| node.data + 1}
    assert_equal([2, 4, 5, 6, 8, 9, 10, 24, 68, 325, 6346], result)
  end

  def test_postorder_method_should_return_data_in_depth_first_order
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal([7, 5, 4, 3, 1, 6345, 324, 67, 23, 9, 8], tree.postorder)
    result = tree.postorder{|node| node.data + 1}
    assert_equal([8, 6, 5, 4, 2, 6346, 325, 68, 24, 10, 9], result)
  end
  
  def test_should_return_the_correct_depth_level_of_the_given_node_else_return_minus_one
    tree = Tree.new([23, 8, 4, 3, 1, 5, 7, 9, 67, 6345, 324])
    assert_equal(2, tree.depth(23))
    assert_equal(3, tree.depth(4))
    assert_equal(5, tree.depth(7))
    assert_equal(-1, tree.depth(999))
  end

  def test_should_return_if_the_tree_is_balanced
    values = Array.new(15) { rand(1..100) }
    balanced_tree = Tree.new(values)
    assert_equal(true, balanced_tree.balanced?)
    balanced_tree = Tree.new([23, 8, 67, 68])
    assert_equal(true, balanced_tree.balanced?)
    balanced_tree = Tree.new([23, 8, 67, 5])
    assert_equal(true, balanced_tree.balanced?)
    not_balanced_tree = Tree.new([23, 8, 67, 5, 10, 1])
    not_balanced_tree.insert(86)
    not_balanced_tree.insert(100)
    not_balanced_tree.insert(150)
    assert_equal(false, not_balanced_tree.balanced?)
  end

  def test_should_rebalance_unbalanced_tree
    tree = Tree.new([23, 8, 67, 5, 10, 1])
    tree.insert(86)
    tree.insert(100)
    tree.insert(150)
    assert_equal(false, tree.balanced?)
    tree.rebalance!
    assert_equal(true, tree.balanced?)
  end
end