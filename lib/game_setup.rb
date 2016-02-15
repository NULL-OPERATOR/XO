class GameSetup
  attr_reader :p1, :p2
  def initialize(game, grid)
    @game = game
    @grid = grid
  end

  def set_players(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def start_game
    @game.new(@grid, @p1, @p2)
  end
end
