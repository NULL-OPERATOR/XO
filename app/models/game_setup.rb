require_relative "game"
require_relative "grid"

class GameSetup
  attr_reader :p1, :p2
  def initialize(game = Game, grid = Grid)
    @game = game
    @grid = grid
  end

  # def set_players(p1, p2)
  #   @p1 = [p1[0], p1]
  #   @p2 = p2
  # end

  def start_game(players)
    @game.new(@grid, players)
  end
end
