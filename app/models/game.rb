class Game
  attr_reader :moves, :turn, :p1
  def initialize(grid, rules, players, ai)
    setup_game_status(grid, rules)
    setup_player_status(players)
    @ai = ai.new(grid, @win_moves)
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
    @win_moves = rules.win_conditions
    @moves = setup_moves(grid)
  end

  def setup_moves(grid)
    grid_size = grid.whole_grid.length
    Array.new(grid_size) { "-" }
  end

  def move_not_available?(move)
    @moves[move] != "-"
  end

  def make_move(move)
    @turn[:mode] == "p" ? player_move(move) : ai_move
  end

  def player_move(move)
    @moves[move] = @turn[:choice]
  end

  def ai_move
    choice = @turn[:choice]
    @moves[@ai.move(@moves, choice)] = choice
  end

  def switch_player
    @turn == @p1 ? @turn = @p2 : @turn = @p1
  end

  def game_over_check
    board_full || winning_move
  end

  def winning_move
    @win_moves.each do |i|
      check = @moves[i[0]] + @moves[i[1]] + @moves[i[2]]
      if check == "xxx" || check == "ooo"
        switch_player
        @turn[:win] = true
      end
    end
  end

  def board_full
    !@moves.join.include?("-")
  end
end
