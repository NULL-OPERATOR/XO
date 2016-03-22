require_relative "game"
require_relative "ai"
require_relative "game_over"

class GameSetup
  attr_reader :game
  def initialize(game = Game, game_over = GameOver, ai = AI)
    @game = game
    @game_over = game_over.new
    @ai   = ai.new
  end

  def new_game(input)
    players = setup_players(input)
    @game.new(@game_over, players, @ai)
  end

  private

  def setup_players(input)
    players = input.split(",").map{ |x| x.to_sym }
    p1 = { player: players[0], choice: players[1] }
    p2 = { player: players[2], choice: players[3] }
    [p1, p2]
  end
end
