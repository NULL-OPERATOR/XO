require_relative "rules"

class GameOver
  def initialize(rules = Rules)
    @win_moves = Rules.win_conditions
  end

  def check(moves, turn, pvp)
    winning_move(moves, turn, pvp) || board_full(moves)
  end

  def winning_move(moves, turn, pvp)
    @win_moves.each do |i|
      next unless winner?(moves, i)
      return message(turn, pvp)
    end
    nil
  end

  def winner?(moves, i)
    check = [moves[i[0]], moves[i[1]], moves[i[2]]].join
    check == "xxx" || check == "ooo"
  end

  def board_full(moves)
    return "DRAW" if moves.count(:-) == 0
  end

  def message(turn, pvp)
    if pvp
      player = "PLAYER"
    else
      player = turn[:player] == :p ? "COMPUTER" : "PLAYER"
    end
    choice = turn[:choice] == :x ? "O" : "X"
    "#{player} - #{choice} - WINS"
  end

end
