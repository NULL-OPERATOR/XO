require_relative "rules"

class AI
  def initialize(rules = Rules)
    @win_moves = Rules.win_conditions
    @edges = [1,3,5,7]
    @corners = [0,2,6,8]
    @opposite_corners = @corners.reverse
  end

  def move(moves, choice)
    @moves = moves
    @choice = choice
    win || block || block_forks || create_fork || center ||
    opposite_corner || empty_corner || empty_side
  end

  private

  def move_free?(move)
    @moves[move] == :-
  end

  def swap_choice
    @choice == :x ? :o : :x
  end

  def win
    find_winner(@choice)
  end

  def block
    find_winner(swap_choice)
  end

  def find_winner(choice)
    @win_moves.each do |move|
      actual = get_actual(move)
      actual.each.with_index do |letter, index|
        check = actual.clone
        next if letter != :-
        check[index] = choice
        return move[index] if check.count(choice) == 3
      end
    end
    nil
  end

  def get_actual(move)
    [ @moves[move[0]], @moves[move[1]], @moves[move[2]] ]
  end

  def create_fork
    count_moves == 2 ? fork_1 || fork_2 : nil
  end

  def fork_1
    return opposite_corner if corners_taken >= 1 && !move_free?(4)
  end

  def fork_2
    return 3 if !move_free?(1)
    return 1 if !move_free?(3)
  end

  def block_forks
    count_moves == 3 ? block_fork_1 || block_fork_2 : nil
  end

  def block_fork_1
    return empty_side if (corners_taken == 2) && (@moves[4] == @choice)
  end

  def block_fork_2
    return 8 if moves_taken?(5,7) || moves_taken?(2,7) || moves_taken?(5,6)
  end

  def moves_taken?(move1, move2)
    !move_free?(move1) && !move_free?(move2)
  end

  def count_moves
    @moves.count{ |c| c == :x || c == :o}
  end

  def corners_taken
    @corners.count{ |x| @moves[x] == :x || @moves[x] == :o}
  end

  def center
    move_free?(4) && count_moves >= 1 ? 4 : nil
  end

  def opposite_corner
    @corners.each.with_index do |corner, index|
      possible_move = @opposite_corners[index]
      next if move_free?(corner)
      next if !move_free?(possible_move)
      return possible_move
    end
    nil
  end

  def empty_corner
    search_array(@corners)
  end

  def empty_side
    search_array(@edges)
  end

  def search_array(arr)
    arr.each{ |i| return i if move_free?(i) }
    nil
  end
end
