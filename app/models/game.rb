class Game
  attr_reader :moves
  def initialize(grid, rules, players)
    @moves = setup_moves(grid)
    @p1 = { mode: players[0], choice: players[1] }
    @p2 = { mode: players[2], choice: players[3] }
    @turn = @p1
    @win_conditions = rules.win_conditions
  end

  def turn(move)
    return unless available?(move)
    setup_turn(move)
    switch_player
  end

  private

  def setup_moves(grid)
    grid_size = grid.whole_grid.length
    Array.new(grid_size) { " " }
  end

  def available?(move)
    @moves[move] == " "
  end

  def setup_turn(move)
    @turn[:mode] == 'p' ? player_turn(move) : ai_turn(move)
  end

  def player_turn(move)
    @moves[move] = @turn[:choice]
  end

  def ai_turn(move)
    @moves[move] #add ai choice
  end

  def switch_player
    @turn == @p1 ? @turn = @p2 : @turn = @p1
  end

end
