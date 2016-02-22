
class AI
  def initialize(grid, win_moves)
    @grid = grid
    @win_moves = win_moves
    @opposite_corners = @grid.corners.reverse
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
        next if letter != "-"
        check[index] = player
        return move[index] if check.join == player * 3
      end
    end
    nil
  end

  def get_actual(move)
    [@moves[move[0]], @moves[move[1]], @moves[move[2]]]
  end

  def create_fork
    # count = count_moves
    # corners_taken = count_corners_taken
    # if count == 2
    #   if (corners_taken >= 1) && (@moves[4] != "-")
    #     return opposite_corner
    #   elsif @moves[1] != "-"
    #     return 3
    #   elsif @moves[3] != "-"
    #     return 1
    #   end
    # end
  end

  def block_forks
    count_moves == 3 ? block_fork_1 || block_fork_2 : nil
  end

  def block_fork_1
    return empty_side if (count_corners_taken == 2) && (@moves[4] == @player)
  end

  def block_fork_2
    return 8 if moves_taken?(5,7) || moves_taken?(2,7) || moves_taken?(5,6)
  end

  def moves_taken?(move1, move2)
    @moves[move1] != "-" && @moves[move2] != "-"
  end

  def count_moves
    @moves.count{ |c| c == 'x' || c == 'o'}
  end

  def count_corners_taken
    @grid.corners.count{ |x| @moves[x] == "x" || @moves[x] == 'o'}
  end

  def center
    @moves[4] == "-" && count_moves >= 1 ? 4 : nil
  end

  def opposite_corner
    @grid.corners.each.with_index do |corner, index|
      possible_move = @opposite_corners[index]
      next if @moves[corner] == "-"
      next if @moves[possible_move] != "-"
      return possible_move
    end
    nil
  end

  # def opposite_corner
  #   @grid.corners.each do |corner|
  #     if @moves[corner] == swap_player
  #       case corner
  #       when corner == 2 && @moves[6] == "-" then return 6
  #       when corner == 6 && @moves[2] == "-" then return 2
  #       when corner == 0 && @moves[8] == "-" then return 8
  #       when corner == 8 && @moves[0] == "-" then return 0
  #       end
  #     end
  #   end
  #   nil
  # end

  def empty_corner
    search_array(@grid.corners)
  end

  def empty_side
    search_array(@grid.edges)
  end

  def search_array(arr)
    arr.each{ |i| return i if @moves[i] == "-" }
    nil
  end

  def swap_player
    @player == 'x' ? 'o' : 'x'
  end
end
