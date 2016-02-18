class Game
  attr_reader :moves, :turn, :p1
  def initialize(grid, rules, players, ai)
    setup_game_status(grid, rules)
    setup_player_status(players)
    @ai = ai.new(grid, @win_conditions)
  end

  def try_move(move = 0)
    return if move_not_available?(move)
    make_move(move)
    switch_player
    game_over_check
  end

  private

  def setup_player_status(players)
    @p1 = { mode: players[0], choice: players[1], win: false}
    @p2 = { mode: players[2], choice: players[3], win: false}
    @turn = @p1
  end

  def setup_game_status(grid, rules)
    @win_conditions = rules.win_conditions
    @moves = setup_moves(grid)
  end

  def setup_moves(grid)
    grid_size = grid.whole_grid.length
    Array.new(grid_size) { " " }
  end

  def move_not_available?(move)
    @moves[move] != " "
  end

  def make_move(move)
    @turn[:mode] == 'p' ? player_move(move) : ai_move
  end

  def player_move(move)
    @moves[move] = @turn[:choice]
  end

  def ai_move
    @moves[@ai.move(@moves)] = @turn[:choice]
  end

  def switch_player
    @turn == @p1 ? @turn = @p2 : @turn = @p1
  end

  def game_over_check
    @win_conditions.each do |i|
      check = @moves[i[0]] + @moves[i[1]] + @moves[i[2]]
      if check == 'xxx' || check == 'ooo'
        switch_player
        @turn[:win] = true
      end
    end
  end

end
