
class AI
  def initialize(grid, win_conditions)
    @grid = grid
    @win_conditions = win_conditions
  end

  def move(moves)
    win || center(moves)
  end

  private

  def win
    # @win_conditions.each do |i|
    #   check = @moves[i[0]] + @moves[i[1]] + @moves[i[2]]
    #   if check == 'xx' || check == 'oo'
    #     return
    #   end
    # end
  end

  def block
  end

  def fork
  end

  def block_fork
  end

  def center(moves)
    moves[@grid.center] == " " ? 4 : nil
  end

  def opposite_corner
  end

  def empty_corner
  end

  def empty_side
  end
end
