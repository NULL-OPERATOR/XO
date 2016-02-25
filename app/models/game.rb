
class Game
  attr_reader :moves, :turn

  def initialize(game_over, players, ai)
    @game_over = game_over
    @moves = Array.new(9) { :- }
    @players = players
    @turn = @players[0]
    @ai = ai
  end

  def player_move(move)
    return unless move_available?(move)
    make_player_move(move)
    switch_player
  end

  def ai_move
    make_ai_move
    switch_player
  end

  def ai_next?
    @turn[:player] == :c
  end

  def over
    @game_over.check(@moves, @turn, pvp?)
  end

  def switch_player
    @turn == @players[0] ? @turn = @players[1] : @turn = @players[0]
  end

  def current_turn
    @turn[:choice].to_s.upcase
  end

  private

  def pvp?
    (@players[0][:choice] == :p) && (@players[1][:choice] == :p)
  end

  def move_available?(move)
    @moves[move] == :-
  end

  def make_player_move(move)
    @moves[move] = @turn[:choice]
  end

  def make_ai_move
    choice = @turn[:choice]
    move = @ai.move(@moves, choice)
    @moves[move] = choice
  end

end
