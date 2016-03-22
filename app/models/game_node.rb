require_relative "./node"

class GameNode < Node
  attr_reader :turn, :players

  def post_initialize(args)
    @players = args[:players]
    @ai      = args[:ai]
    @turn    = players.first
  end

  def over
    game_over
  end

  def game_move(move)
    if ai_next?
      make_move(turn[:choice], ai_move)
    else
      return unless move_available?(move)
      make_move(turn[:choice], move)
    end
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

  def move_available?(move)
    moves[move] == :-
  end

  def ai_move
    return 0 if board_empty?
    ai.move(self, turn[:choice])
  end

  def board_empty?
    moves.uniq.length == 1
  end

  def switch_player
    p1, p2 = players
    @turn == p1 ? @turn = p2 : @turn = p1
  end
end
