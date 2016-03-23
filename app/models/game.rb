class Game
  attr_reader :turn, :players

  def initialize(args = {})
    @players   = args[:players]
    @ai        = args[:ai]
    @game_node = args[:node]
    @turn      = players.first
  end

  def game_move(move)
    return if (!ai_next? && !game_node.move_available?(move))
    ai_next? ? ai_move : player_move(move)
    switch_player
  end

  def ai_next?
    turn[:player] == :computer
  end

  def current_choice
    turn[:choice].upcase
  end

  def moves
    game_node.moves
  end

  def winner
    game_node.winner
  end

  private

  attr_reader :ai, :game_node
  attr_writer :turn

  def player_move_free?(move)
    game_node.move_available?(move) && !ai_next?
  end

  def player_move(move)
    game_node.make_move(turn[:choice], move)
  end

  def ai_move
    game_node.make_move(turn[:choice], make_ai_move)
  end

  def make_ai_move
    return 0 if board_empty?
    move = ai.move(game_node, turn[:choice])
  end

  def board_empty?
    moves.uniq.length == 1
  end

  def switch_player
    p1, p2 = players
    turn == p1 ? @turn = p2 : @turn = p1
  end
end
