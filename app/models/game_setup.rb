require_relative "game"
require_relative "grid"

class GameSetup
  def initialize(game = Game, grid = Grid)
    @game = game
    @grid = grid
  end

  def start_game(players)
    @game.new(@grid, players)
  end
end
