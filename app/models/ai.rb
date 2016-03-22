class AI
  def initialize(args = {})
    @node_class = args[:node] || Node
    @max = :x
  end

  def make_move(node, player)
    @max = player
    minimax(node, player)
  end

  private

  attr_reader :max

  def minimax(node, player, depth=0)
    return node_value(node.winner, depth,player) if node.winner#  || depth == 0
    values = []
    moves = node.moves
    moves.each.with_index do |space, move|
      next if space != :-
      leaf_node = setup_leaf_node(moves.clone, player, move)
      value = minimax(leaf_node, switch_player(player), depth - 1)
      values << [move, value]
    end
    best_node(values, depth, player)
  end

  def setup_leaf_node(moves, player, move)
    leaf = @node_class.new(moves: moves)
    leaf.make_move(player, move)
    leaf
  end

  def node_value(winner, depth, player)
     return 0 if winner == :draw
     player == max ? -10 :  10
   end

  def best_node(values, depth, player)
    best = player == max ? values.max_by(&:last) : values.min_by(&:last)
    depth == 0 ? best.first : best.last
  end

  def switch_player(player)
    player == :x ? :o : :x
  end

end
#
#   def minimax(node, depth, player)
#     values = []
#
#     return node_value(node.winner, depth) if node.winner || depth == 0
#
#     node.moves.each.with_index do |space, move|
#       next if space != :-
#       moves = node.moves.clone
#       node2 = @node_class.new(moves: moves)
#       node2.make_move(player, move)
#       p "depth #{depth}"
#       # d = -1 * minimax(node2, depth + 1, switch_player(player))
#       d = minimax(node2, depth - 1, switch_player(player))
#
#       values << [move, d]
#       # node.moves[move] = :-
#     end
#     p values
#     best_node(values, depth, player)
#   end
#
#   def node_value(winner, depth)
#     return 0 if winner == :draw
#     winner == @max ?  10 - depth : depth - 10
#   end
#
#   def best_node(values, depth, player)
#     best = player == @max ? values.max_by(&:last) : values.min_by(&:last)
#     p "best #{best}"
#     p "depth #{depth}"
#     p best.first
#     depth == @depth ? best.first : best.last
#   end
#
#   def switch_player(player)
#     player == :x ? :o : :x
#   end
#
# end
