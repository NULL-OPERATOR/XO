class Game
  attr_reader :moves, :turn, :p1, :game_over
  def initialize(grid, rules, players, ai)
    setup_game_status(grid, rules)
    setup_player_status(players)
    @ai = ai.new(grid, @win_moves)
  end

  def player_move(move)
    return unless move_available?(move)
    make_player_move(move)
    switch_player
    game_over_check
  end

  def ai_move
    make_ai_move
    switch_player
    game_over_check
  end

  def ai_next?
    @turn[:player] == 'c'
  end

  private

  def setup_player_status(players)
    @p1 = { player: players[0], choice: players[1], win: false}
    @p2 = { player: players[2], choice: players[3], win: false}
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

  def move_available?(move)
    @moves[move] == "-"
  end

  def make_player_move(move)
    @moves[move] = @turn[:choice]
  end

  def make_ai_move
    choice = @turn[:choice]
    move = @ai.move(@moves, choice)
    @moves[move] = choice
  end

  def switch_player
    @turn == @p1 ? @turn = @p2 : @turn = @p1
  end

  def game_over_check
    winning_move
    board_full unless @game_over
  end

  def winning_move
    @win_moves.each do |i|
      check = @moves[i[0]] + @moves[i[1]] + @moves[i[2]]
      next unless check == "xxx" || check == "ooo"
      switch_player
      @game_over = set_win_message
    end
  end

  def set_win_message
    player = @turn[:player] == 'c' ? "COMPUTER" : "PLAYER"
    choice = @turn[:choice].upcase
    "#{player} - #{choice} - WINS"
  end

  def board_full
    if !@moves.join.include?("-")
      @game_over = "DRAW"
    end
  end
end
