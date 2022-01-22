class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(item)
    @stack.push(item)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[length - 1]
  end

  def empty?
    @stack.length == 0
  end

  def length
    @stack.length
  end
end
