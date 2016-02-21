
class AI
  def initialize(grid, win_moves)
    @grid = grid
    @win_moves = win_moves
  end

  def move(moves, player)
    @moves = moves
    @player = player
    win || block || block_forks || create_fork || center ||
    opposite_corner || empty_corner || empty_side
  end

  private

  def win
    find_winner(@player)
  end

  def block
    find_winner(swap_player)
  end

  def find_winner(player)
    @win_moves.each do |move|
      actual = get_actual(move)
      actual.each.with_index do |letter, index|
        check = actual.clone
        if letter == " "
          check[index] = player
          if check.join == player * 3
            return move[index]
          end
        end
      end
    end
    nil
  end

  def get_actual(move)
    [@moves[move[0]], @moves[move[1]], @moves[move[2]]]
  end

  def create_fork
  end

  def block_forks
    count = @moves.count{ |c| c == 'x' || c == 'o'}
    corners_taken = @grid.corners.count{ |x| @moves[x] == "x" || @moves[x] == 'o'}
    if count == 3
      if corners_taken == 2
        return empty_side
      elsif @moves[5] != " " && @moves[7] != " "
        return 8
      elsif @moves[2] != " " && @moves[7] != " "
        return 8
      elsif @moves[5] != " " && @moves[6] != " "
        return 8
      end
    end
    nil
  end

  def center
    @moves[4] == " " ? 4 : nil
  end

  def opposite_corner
    @grid.corners.each do |corner|
      if @moves[corner] == swap_player
        case corner
        when corner == 2 && @moves[6] == " " then return 6
        when corner == 6 && @moves[2] == " " then return 2
        when corner == 0 && @moves[8] == " " then return 8
        when corner == 8 && @moves[0] == " " then return 0
        end
      end
    end
    nil
  end

  def empty_corner
    search_array(@grid.corners)
  end

  def empty_side
    search_array(@grid.edges)
  end

  def search_array(arr)
    arr.each{ |i| return i if @moves[i] == " " }
    nil
  end

  def swap_player
    @player == 'x' ? 'o' : 'x'
  end
end
