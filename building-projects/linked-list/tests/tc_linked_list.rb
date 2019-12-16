require_relative '../linked_list.rb'
require_relative '../node.rb'
require 'test/unit'

class TestLinkedList < Test::Unit::TestCase

  def test_to_s_should_return_the_correct_format_of_a_list
    list = LinkedList.new
    assert_equal('nil', list.to_s)
    node1 = Node.new('data1')
    node2 = Node.new('data2')
    list.append(node1)
    list.append(node2)
    assert_equal('( data1 ) -> ( data2 ) -> nil', list.to_s)
  end
  
  def test_append_should_add_a_node_to_the_end_of_the_list
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal('( value1 ) -> ( value2 ) -> ( value3 ) -> nil', list.to_s)
  end
  
  def test_prepend_should_add_a_node_to_the_start_of_the_list
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.prepend(node1)
    list.prepend(node2)
    list.prepend(node3)
    assert_equal('( value3 ) -> ( value2 ) -> ( value1 ) -> nil', list.to_s)
  end

  def test_size_should_return_the_number_of_nodes_in_the_list
    list1 = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list1.append(node1)
    list1.prepend(node2)
    assert_equal(2, list1.size)

    list2 = LinkedList.new
    assert_equal(0, list2.size)


    list3 = LinkedList.new
    node = Node.new('value')
    list3.append(node)
    assert_equal(1, list3.size)
  end

  def test_head_should_return_the_first_element_in_the_list
    list = LinkedList.new
    assert_equal(nil, list.head)
    node1 = Node.new('first')
    node2 = Node.new('last')
    list.append(node1)
    list.append(node2)
    assert_not_nil(list.head)
    assert_equal('first', list.head.value)
  end
  def test_tail_should_return_the_last_element_in_the_list
    list = LinkedList.new
    assert_equal(nil, list.head)
    node1 = Node.new('first')
    node2 = Node.new('last')
    list.append(node1)
    list.append(node2)
    assert_not_nil(list.tail)
    assert_equal('last', list.tail.value)
  end

  def test_should_return_the_correct_node_at_the_given_index
    list = LinkedList.new
    node0 = Node.new('with_index_0')
    node1 = Node.new('with_index_1')
    node2 = Node.new('with_index_2')
    node3 = Node.new('with_index_3')
    list.append(node0)
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_not_nil(list.at(2))
    assert_equal('with_index_2', list.at(2).value)
    list2 = LinkedList.new
    assert_nil(list2.at(0))
  end

  def test_should_remove_the_last_element_from_the_list
    list = LinkedList.new
    node0 = Node.new('with_index_0')
    node1 = Node.new('with_index_1')
    list.append(node0)
    list.append(node1)
    assert_equal(2, list.size)
    assert_equal('with_index_1', list.tail.value)
    list.pop
    assert_equal(1, list.size)
    assert_equal('with_index_0', list.tail.value)

    list2 = LinkedList.new
    assert_equal(0, list2.size)
    list2.pop
    assert_equal(0, list2.size)
  end

  def test_should_return_true_or_false_if_the_given_value_exists_in_the_list
    list = LinkedList.new
    assert_false(list.contains?('value'))
    node1 = Node.new('value1') 
    node2 = Node.new('value2')
    list.append(node1)
    list.append(node2)
    assert_true(list.contains?('value1'))
    assert_true(list.contains?('value2'))
    assert_false(list.contains?('not_exist'))
  end

  def test_should_the_index_of_the_node_which_has_the_given_data
    list = LinkedList.new
    node1 = Node.new('value1') 
    node2 = Node.new('value2')
    list.append(node1)
    list.append(node2)
    assert_equal(1, list.find('value2'))
    assert_nil(list.find('value_doesnt_exist'))
  end

  def test_should_insert_the_new_node_at_the_given_index
    list = LinkedList.new
    node0 = Node.new('value0')
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.append(node0)
    list.append(node1)
    list.append(node2)
    assert_equal(3, list.size)
    assert_equal(1, list.find('value1'))
    list.insert_at(1)
    assert_equal(4, list.size)
    assert_equal(nil, list.at(1).value)
    assert_equal(2, list.find('value1'))
  end
  def test_should_insert_at_first_index
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.append(node1)
    list.append(node2)
    list.insert_at(0)
    assert_equal(3, list.size)
    assert_equal(nil, list.at(0).value)
    assert_equal('value1', list.at(1).value)
  end
  def test_should_not_insert_a_node_for_not_found_index
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.append(node1)
    list.append(node2)
    list.insert_at(8)
    list.insert_at(-1)
    assert_equal(2, list.size)
  end

  def test_should_remove_at_index
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal(3, list.size)
    assert_equal('value2', list.at(1).value)
    assert_equal(2, list.find('value3'))
    list.remove_at(1)
    assert_equal(2, list.size)
    assert_equal(1, list.find('value3'))
  end

end