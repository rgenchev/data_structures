class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(item)
    stack.push(item)
  end

  def pop
    stack.pop
  end

  def peek
    stack[length - 1]
  end

  def empty?
    stack.length == 0
  end

  def length
    stack.length
  end
end

puts "Creating a stack"
stack = Stack.new

puts "Stack empty? - #{stack.empty?}"

stack.push(1)
stack.push(2)
stack.push(3)

puts "Stack: #{stack.stack}"
puts "Stack length: #{stack.length}"

puts "Popping from the stack"
stack.pop

puts "Stack: #{stack.stack}"
puts "Stack length: #{stack.length}"

puts "Peek: #{stack.peek}"

puts "Stack empty? - #{stack.empty?}"
