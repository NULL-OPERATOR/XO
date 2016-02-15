class GameSetup
  attr_reader :p1, :p2
  def set_players(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def start_game(grid)
    Game.new(grid, @p1, @p2)
  end
end
