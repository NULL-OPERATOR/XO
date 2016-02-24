require_relative "game"
require_relative "grid"
require_relative "rules"
require_relative "ai"

class GameSetup
  attr_reader :game, :grid, :rules
  def initialize(game = Game, grid = Grid, rules = Rules, ai = AI)
    @game  = game
    @grid  = grid
    @rules = rules
    @ai    = ai
  end

  def new_game(players)
    @game.new(@grid, @rules, players, @ai)
  end
end
