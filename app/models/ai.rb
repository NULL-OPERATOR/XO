class AI
  def initialize(args = {})
    @node_class = args[:node]
    @max_player = :x
  end

  def move(node, player)
    @max_player = player
    minimax(node, player)
  end

  private

  attr_reader :max_player, :node_class

  def minimax(node, player, depth=0)
    return node_value(node.winner, player) if node.winner
    values = []
    node.moves.each.with_index do |choice, move|
      next if choice != :-
      value = minimax(new_leaf_node(node.moves.clone, player, move),
                      switch_player(player),
                      depth - 1)
      values << [move, value]
    end
    best_node(values, depth, player)
  end

  def new_leaf_node(moves, player, move)
    leaf = node_class.new(moves: moves)
    leaf.make_move(player, move)
    leaf
  end

  def node_value(winner, player)
     return 0 if winner == :draw
     player == max_player ? -10 : 10
  end

  def best_node(values, depth, player)
    value = max_or_min_value(values, player)
    depth == 0 ? value.first : value.last
  end

  def max_or_min_value(values, player)
    player == max_player ? values.max_by(&:last) : values.min_by(&:last)
  end

  def switch_player(player)
    player == :x ? :o : :x
  end
end
