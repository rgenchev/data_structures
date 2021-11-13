class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(item)
    queue.push(item)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue[0]
  end

  def empty?
    queue.length == 0
  end

  def length
    queue.length
  end
end

puts "Creating a queue"
queue = Queue.new

puts "Queue empty? - #{queue.empty?}"

puts "Enqueuing some items..."
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

puts "Queue: #{queue.queue}"
puts "Queue length: #{queue.length}"

puts "Dequeuing..."
queue.dequeue

puts "Queue: #{queue.queue}"
puts "Queue length: #{queue.length}"

puts "Peek: #{queue.peek}"

puts "Dequeuing..."
queue.dequeue

puts "Queue: #{queue.queue}"
puts "Queue length: #{queue.length}"

puts "Queue empty? - #{queue.empty?}"
