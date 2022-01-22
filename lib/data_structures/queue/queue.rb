class Queue::Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

  def empty?
    @queue.length == 0
  end

  def length
    @queue.length
  end
end
