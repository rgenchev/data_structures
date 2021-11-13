class Node
  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end
