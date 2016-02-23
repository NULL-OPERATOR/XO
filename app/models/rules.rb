class Rules
  def self.win_conditions
    [
      [0,1,2],
      [0,3,6],
      [0,4,8],
      [3,4,5],
      [6,7,8],
      [2,5,8],
      [1,4,7],
      [2,4,6]
    ]
  end
end

# board
# 0 1 2
# 3 4 5
# 6 7 8

# 0x 1o 2x
# 3x 4o 5o
# 6o 7x 8x
