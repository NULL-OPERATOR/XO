require_relative "../app/models/game"


describe Game do
  let(:game) { described_class.new(grid, players) }
  let(:grid) {
    class_double(
      :grid,
      whole_grid: [1,2,3,4,5,6,7,8,9],
      corners: [1,3,7,9],
      edges: [2,4,6,8],
      center: [5]
      )
    }
  let(:players) { ['p', 'x', 'p', 'o']}

  it("allows a player to choose a move")
end
