class Game
  attr_reader :moves
  def initialize(grid, players)
    grid_size = grid.whole_grid.length
    @moves = Array.new(grid_size) { "_" }
    @p1 = { mode: players[0], choice: players[1] }
    @p2 = { mode: players[2], choice: players[3] }
  end

  def move(input)
  end


  private


end
