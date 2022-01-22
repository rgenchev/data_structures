require "test_helper"

class StackTest < Minitest::Test
  def setup
    @stack = Stack.new
  end

  def test_should_push_items
    assert_equal 0, @stack.length

    @stack.push(1)

    assert_equal 1, @stack.length
  end

  def test_pop_should_remove_last_element_from_stack
    @stack.push(1)
    @stack.push(2)

    assert_equal 2, @stack.pop
    assert_equal [1], @stack.stack
  end

  def test_peek_should_return_last_element_from_stack
    @stack.push(1)
    @stack.push(2)

    assert_equal 2, @stack.peek
    assert_equal [1, 2], @stack.stack
  end

  def test_should_return_whether_stack_is_empty_or_not
    assert @stack.empty?

    @stack.push(1)

    refute @stack.empty?
  end

  def test_should_return_stack_length
    @stack.push(1)
    @stack.push(2)
    @stack.push(3)

    assert_equal 3, @stack.length
  end
end
