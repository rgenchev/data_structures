require "test_helper"

class GraphTest < Minitest::Test
  def setup
    @graph = Graph.new
  end

  def test_should_initialize_with_directed_defaulting_to_false_and_empty_nodes_array
    refute @graph.directed
    assert_empty @graph.nodes
  end

  def test_should_add_new_nodes_to_the_graph
    @graph.add_node("Sofia")

    sofia_node = @graph.get_node("Sofia")

    refute_nil sofia_node
    assert_includes @graph.nodes, sofia_node
  end

  def test_should_remove_node_and_all_edges_connected_to_this_node_by_a_given_value
    @graph.add_node("Sofia")
    @graph.add_node("Plovdiv")
    @graph.add_node("Varna")

    @graph.add_edge("Sofia", "Plovdiv")
    @graph.add_edge("Sofia", "Varna")
    @graph.add_edge("Plovdiv", "Varna")

    @graph.remove_node("Plovdiv")

    refute_includes @graph.nodes.map(&:value), "Plovdiv"

    @graph.nodes.each do |node|
      refute_includes node.edges.map(&:value), "Plovdiv"
    end
  end

  def test_should_add_edges_between_nodes_in_both_directions_if_the_graph_is_undirected
    @graph.add_node("Sofia")
    @graph.add_node("Plovdiv")

    @graph.add_edge("Sofia", "Plovdiv")

    sofia_node = @graph.get_node("Sofia")
    plovdiv_node = @graph.get_node("Plovdiv")

    assert_includes sofia_node.edges.map(&:value), plovdiv_node.value
    assert_includes plovdiv_node.edges.map(&:value), sofia_node.value
  end

  def test_should_add_edges_between_nodes_in_one_direction_if_the_graph_is_directed
    directed_graph = Graph.new(directed: true)

    directed_graph.add_node("Sofia")
    directed_graph.add_node("Plovdiv")

    directed_graph.add_edge("Sofia", "Plovdiv")

    sofia_node = directed_graph.get_node("Sofia")
    plovdiv_node = directed_graph.get_node("Plovdiv")

    assert_includes sofia_node.edges.map(&:value), plovdiv_node.value
    refute_includes plovdiv_node.edges.map(&:value), sofia_node.value
  end

  def test_should_get_node_by_value
    @graph.add_node("Sofia")

    refute_nil @graph.get_node("Sofia")
    assert_nil @graph.get_node("Plovdiv")
  end
end
