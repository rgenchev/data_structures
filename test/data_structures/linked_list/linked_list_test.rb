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
end
