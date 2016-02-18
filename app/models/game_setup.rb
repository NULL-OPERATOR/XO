require_relative "game"
require_relative "grid"
require_relative "rules"

class GameSetup
  def initialize(game = Game, grid = Grid, rules = Rules)
    @game  = game
    @grid  = grid
    @rules = rules
  end

  def start_game(players)
    @game.new(@grid, @rules, players)
  end
end
