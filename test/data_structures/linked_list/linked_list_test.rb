require "test_helper"

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_should_initialize_with_head_and_tail_set_to_nil
    assert_nil @linked_list.head
    assert_nil @linked_list.tail
  end

  def test_should_initialize_with_length_set_to_zero
    assert_equal 0, @linked_list.length
  end

  def test_should_set_head_and_tail_to_the_first_node_when_pushing_the_first_node_in_the_list
    @linked_list.push("A")

    assert_equal "A", @linked_list.head.value
    assert_equal "A", @linked_list.tail.value
  end

  def test_should_increment_the_list_length_when_pushing_new_nodes
    @linked_list.push("A")

    assert_equal 1, @linked_list.length
  end

  def test_should_return_whether_the_list_is_empty_or_not
    assert @linked_list.empty?

    @linked_list.push("A")

    refute @linked_list.empty?
  end

  def test_should_set_tail_to_the_last_pushed_node_in_the_list
    push_multiple_nodes_to_the_linked_list

    assert_equal "C", @linked_list.tail.value
  end

  def test_should_set_the_previous_node_next_attribute_to_the_last_pushed_node
    push_multiple_nodes_to_the_linked_list

    assert_equal "B", @linked_list.head.next.value
  end

  def test_pop_should_return_nil_if_trying_pop_from_an_empty_list
    assert_nil @linked_list.pop
  end

  def test_pop_should_return_the_removed_node_if_the_length_of_the_list_equals_one
    @linked_list.push("A")
    node_to_remove = @linked_list.tail

    removed_node = @linked_list.pop

    assert_equal removed_node, node_to_remove
  end

  def test_pop_should_set_head_and_tail_to_nil_and_decrement_the_length_if_the_length_of_the_list_equals_one
    @linked_list.push("A")

    @linked_list.pop

    assert_nil @linked_list.head
    assert_nil @linked_list.tail
    assert_equal 0, @linked_list.length
  end

  def test_pop_should_remove_the_tail_node_if_the_length_of_the_list_is_greater_than_one
    push_multiple_nodes_to_the_linked_list
    node_to_remove = @linked_list.tail

    removed_node = @linked_list.pop

    assert_equal removed_node, node_to_remove
  end

  def test_pop_should_set_the_second_to_last_node_to_the_tail_node_if_the_length_of_the_list_is_greater_than_one
    push_multiple_nodes_to_the_linked_list

    @linked_list.pop

    assert_equal "B", @linked_list.tail.value
  end

  def test_pop_should_set_the_second_to_last_node_next_attribute_to_nil_if_the_length_of_the_list_is_greater_than_one
    push_multiple_nodes_to_the_linked_list

    @linked_list.pop

    assert_nil @linked_list.tail.next
  end

  def test_pop_should_decrement_the_length_if_the_length_of_the_list_is_greater_than_one
    push_multiple_nodes_to_the_linked_list

    @linked_list.pop

    assert_equal 2, @linked_list.length
  end

  def test_should_return_nil_when_trying_to_get_a_node_on_a_negative_position
    push_multiple_nodes_to_the_linked_list

    assert_nil @linked_list.get(-1)
  end

  def test_should_return_nil_when_trying_to_get_a_node_on_a_position_greater_than_the_length_of_the_list
    push_multiple_nodes_to_the_linked_list

    assert_nil @linked_list.get(@linked_list.length + 3)
  end

  def test_should_return_nil_when_trying_to_get_a_node_from_an_empty_list
    assert_nil @linked_list.get(3)
  end

  def test_should_return_head_when_getting_the_node_on_position_0
    push_multiple_nodes_to_the_linked_list

    assert_equal @linked_list.head, @linked_list.get(0)
  end

  def test_should_return_the_node_on_a_given_valid_position
    push_multiple_nodes_to_the_linked_list

    assert_equal "B", @linked_list.get(1).value
  end

  private
    def push_multiple_nodes_to_the_linked_list
      @linked_list.push("A")
      @linked_list.push("B")
      @linked_list.push("C")
    end
end
