require_relative "rules"

class GameOver
  def initialize(rules = Rules)
    @win_moves = Rules.win_conditions
  end

  def check(moves, players, turn)
    @turn = turn
    @players = players
    @moves = moves
    winning_move || board_full
  end

  private

  def winning_move
    @win_moves.each do |move|
      next unless winner?(move)
      swap_players
      return message
    end
    nil
  end

  def winner?(move)
    check = [@moves[move[0]], @moves[move[1]], @moves[move[2]]].join
    check == "xxx" || check == "ooo"
  end

  def board_full
    return "DRAW" if @moves.count(:-) == 0
  end

  def swap_players
    @turn = @turn == @players[0] ? @players[1] : @players[0]
  end

  def message
    player = @turn[:player] == :p ? "PLAYER" : "COMPUTER"
    choice = @turn[:choice].upcase
    "#{player} - #{choice} - WINS"
  end

end
