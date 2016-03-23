require_relative "./node"

class GameNode < Node
  attr_reader :turn, :players

  def post_initialize(args)
    @players = args[:players]
    @ai      = args[:ai]
    @turn    = players.first
  end

  def game_move(move)
    ai_next? ? ai_move : player_move(move)
    switch_player
  end

  def ai_next?
    turn[:player] == :c
  end

  def current_choice
    turn[:choice].upcase
  end

  private

  attr_reader :ai
  attr_writer :turn

  def player_move(move)
    return unless moves[move] == :-
    make_move(turn[:choice], move)
  end

  def ai_move
    make_move(turn[:choice], make_ai_move)
  end

  def make_ai_move
    return 0 if board_empty?
    move = ai.move(self, turn[:choice])
  end

  def board_empty?
    moves.uniq.length == 1
  end

  def switch_player
    p1, p2 = players
    turn == p1 ? @turn = p2 : @turn = p1
  end
end
