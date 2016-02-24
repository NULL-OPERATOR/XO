require_relative "../app/models/game"

describe Game do
  win_conditions = [[0,1,2],[0,3,6],[0,4,8],[3,4,5],[6,7,8],[2,5,8],[1,4,7],[2,4,6]]
  let(:game)    { described_class.new(grid, rules, players, ai) }
  let(:grid)    { class_double("Grid", whole_grid: [0,1,2,3,4,5,6,7,8]) }
  let(:rules)   { class_double("Rules", win_conditions: win_conditions)}
  let(:ai)      { class_double("AI", new: true) }
  let(:players) { ['p','x','p','o'] }
  let(:moves)   { Array.new(9) { "-"} }
  let(:player1) { { player: players[0], choice: players[1], win: false} }

  it "should initialize an array of empty moves, of grid length" do
    expect(game.moves).to eq(moves)
  end

  it "should set up a player" do
    expect(game.p1).to eq(player1)
  end

  it "should set the current turn to be player1's" do
    expect(game.turn).to eq(player1)
  end

  it "should be able to make a move and store it" do
    game.player_move(1)
    expect(game.moves[1]).to eq('x')
  end

  it "should not change moves if the move is taken" do
    game.player_move(1)
    expect{ game.player_move(1) }.not_to change{ game.moves }
  end

  it "should switch player on the second move" do
    game.player_move(1)
    expect(game.turn).not_to be(player1)
  end

  it "should set the initial win status of a player to false" do
    expect(game.p1[:win]).to be(false)
  end

  it "should be able to win a game" do
    game.player_move(0)
    game.player_move(3)
    game.player_move(1)
    game.player_move(4)
    game.player_move(2)
    expect(game.game_over).to eq("PLAYER - X - WINS")
  end
end
