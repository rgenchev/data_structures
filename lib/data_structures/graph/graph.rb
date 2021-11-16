require_relative "node"

class Graph
  attr_accessor :directed, :nodes

  def initialize(directed = false)
    @directed = directed
    @nodes = []
  end

  def add_node(value)
    nodes << Node.new(value)
  end

  def remove_node(value)
    node_to_remove = get_node(value)

    nodes.delete(node_to_remove)

    nodes.each do |node|
      node.edges.delete(node_to_remove)
    end
  end

  def add_edge(value_1, value_2)
    node_1 = get_node(value_1)
    node_2 = get_node(value_2)

    node_1.edges.push(node_2)

    unless directed
      node_2.edges.push(node_1)
    end
  end

  def get_node(value)
    nodes.find { |node| node.value == value }
  end
end
