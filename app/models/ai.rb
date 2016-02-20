
class AI
  def initialize(grid, win_conditions)
    @grid = grid
    @win_moves = setup_win_moves(win_conditions)
  end

  def move(moves,turn)
    @moves = moves
    @turn = turn
    win ||
    block ||
    create_fork ||
    block_fork ||
    center ||
    opposite_corner ||
    empty_corner ||
    empty_side
  end

  private

  def setup_win_moves(moves)
    moves.map{|move| [[move[0], " "],[move[1], " "],[move[2], " "]] }
  end

  def win
    @win_moves.each do |move|
      move.each do |i|
        check = move
        if i == " "
          check[i] = @turn[:choice]
          if check.join == "xxx" || check.join == "ooo"
            return i
          end
        end
      end
    end
    nil
  end

  def block

  end

  def create_fork

  end

  def block_fork

  end

  def center
    @moves[@grid.center] == " " ? 4 : nil

  end

  def opposite_corner

  end

  def empty_corner
    @grid.corners.each do |corner|
      if @moves[corner] == " "
        return corner
      end
    end
    nil
  end

  def empty_side
    @grid.sides.each do |corner|
      if @moves[corner] == " "
        return corner
      end
    end
  nil
  end
end
