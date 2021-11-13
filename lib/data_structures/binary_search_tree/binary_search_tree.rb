require_relative "node"

class BinarySearchTree
  attr_accessor :root

  def add_child(value)
    Node.new(value) if root.nil?
      
    current_node = root
    added = false

    while !added && current_node
      return "Duplicates are not allowed." if value == current_node.value

      if value < current_node.value
        if current_node.left_child.nil?
          current_node.left_child = Node.new(value)
          added = true
        else
          current_node = current_node.left_child
        end
      elsif value > current_node.value
        if current_node.right_child.nil?
          current_node.right_child = Node.new(value)
          added = true
        else
          current_node = current_node.right_child
        end
      end
    end
  end
end
