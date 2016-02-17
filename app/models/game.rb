class Game
  attr_reader :moves
  def initialize(grid, players)
    grid_size = grid.whole_grid.length
    @moves = Array.new(grid_size) { " " }
    @p1 = { mode: players[0], choice: players[1] }
    @p2 = { mode: players[2], choice: players[3] }
    @turn = @p1
  end

  def turn(move)
    return unless available?(move)
    make_turn(move)
    switch_player
  end

  private

  def available?(move)
    @moves[move] == " "
  end

  def make_turn(move)
    @turn[:mode] == 'p' ? player_turn(move) : ai_turn(move)
  end

  def player_turn(move)
    @moves[move] = @turn[:choice]
  end

  def ai_turn(move)
    @moves[move] #add ai choice
  end

  def switch_player
    if @turn == @p1
      @turn = @p2
    else
      @turn = @p1
    end
  end


end
