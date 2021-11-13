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

    puts "An edge between #{node_1.value} and #{node_2.value} was created."
  end

  def get_node(value)
    nodes.find { |node| node.value == value }
  end
end

puts "Creating the graph..."

graph_bulgarian_cities = Graph.new

puts "..."

puts "Creating nodes..."

puts "Adding 'Sofia' to the graph..."
graph_bulgarian_cities.add_node("Sofia")

puts "Adding 'Plovdiv' to the graph..."
graph_bulgarian_cities.add_node("Plovdiv")

puts "Adding 'Varna' to the graph..."
graph_bulgarian_cities.add_node("Varna")

puts "..."

graph_bulgarian_cities.add_edge("Sofia", "Plovdiv")
graph_bulgarian_cities.add_edge("Sofia", "Varna")
graph_bulgarian_cities.add_edge("Plovdiv", "Varna")

puts "..."
puts "Cities in the graph: #{graph_bulgarian_cities.nodes.map(&:value)}"
graph_bulgarian_cities.nodes.each do |node|
  puts "#{node.value} node has the following edges: #{node.edges.map(&:value)}"
end

puts "..."

puts "Removing 'Varna'..."
graph_bulgarian_cities.remove_node("Varna")

puts "..."

puts "Cities in the graph: #{graph_bulgarian_cities.nodes.map(&:value)}"
graph_bulgarian_cities.nodes.each do |node|
  puts "#{node.value} node has the following edges: #{node.edges.map(&:value)}"
end
