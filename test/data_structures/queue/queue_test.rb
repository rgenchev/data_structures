require "test_helper"

class QueueTest < Minitest::Test
  def setup
    @queue = Queue::Queue.new
  end

  def test_should_be_able_to_access_queue
    @queue.enqueue(1)

    assert_equal [1], @queue.queue
  end

  def test_should_enqueue_items
    @queue.enqueue(1)

    assert_equal [1], @queue.queue
  end

  def test_should_dequeue_items
    @queue.enqueue(1)
    @queue.dequeue

    assert_equal 0, @queue.length
  end

  def test_should_return_nil_for_peek_when_queue_is_empty
    assert_nil @queue.peek
  end

  def test_should_return_peek_item
    @queue.enqueue(1)
    @queue.enqueue(2)

    assert_equal 1, @queue.peek
  end

  def test_should_return_whether_queue_is_empty_or_not
    assert @queue.empty?

    @queue.enqueue(1)

    refute @queue.empty?
  end

  def test_should_return_queue_length
    @queue.enqueue(1)
    @queue.enqueue(2)
    @queue.enqueue(3)

    assert_equal 3, @queue.length
  end
end
