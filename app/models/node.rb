class Node
  WIN_MOVES = [ [0,1,2],[0,3,6],[0,4,8],[3,4,5],[6,7,8],[2,5,8],[1,4,7],[2,4,6]]
  attr_reader :moves, :winner
  attr_writer :moves, :winner


  def initialize(args)
    @moves = args[:moves]
    @winner = false
    post_initialize(args)
  end

  def make_move(player, move)
    moves[move] = player
    game_over_check(player)
  end

  private


  def post_initialize(args)
    nil
  end

  def game_over_check(player)
    winner_check(player)
    check_draw unless winner
  end

  def winner_check(player)
    WIN_MOVES.each{ |move| winning_move(move) ? @winner = player  : next }
  end

  def winning_move(move)
    a, b, c = move
    check = [moves[a], moves[b], moves[c]]
    check == [:x,:x,:x] || check == [:o,:o,:o]
  end

  def check_draw
    @winner = :draw if moves.count(:-) == 0
  end



end
