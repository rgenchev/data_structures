require_relative "node"

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(value)
    new_node = Node.new(value)

    if empty?
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next = new_node
      self.tail = new_node
    end

    self.length += 1
  end

  def pop
    return nil if empty?

    if length == 1
      node_to_remove = head

      self.head = nil
      self.tail = nil

      self.length -= 1

      node_to_remove
    else
      current_node = head
      node_to_remove = tail
      second_to_last_node = nil

      while current_node
        if (current_node.next == tail)
          second_to_last_node = current_node
          break
        end

        current_node = current_node.next
      end

      second_to_last_node.next = nil
      self.tail = second_to_last_node
      self.length -= 1

      node_to_remove
    end
  end

  def get(index)
    return nil if index < 0 || index > length || empty?

    return head if index == 0
    return tail if index == (length - 1)

    current_node = head

    index.times { current_node = current_node.next }

    current_node
  end

  def empty?
    length == 0
  end
end
