require_relative "../app/models/game_over"

describe GameOver do
  win_conditions = [[0,1,2],[0,3,6],[0,4,8],[3,4,5],[6,7,8],[2,5,8],[1,4,7],[2,4,6]]
  let(:gameover) { described_class.new(win_conditions) }
  let(:turn) { { player: :p, choice: :o} }
  let(:players) { [{ player: :p, choice: :o}, { player: :c, choice: :x}] }

  it "should be able to check a winning move, and return a message" do
    moves = [:x,:x,:x,
             :-,:-,:-,
             :-,:-,:-]
    expect(gameover.check(moves, players, turn)).to eq("COMPUTER - X - WINS")
  end

  it "should be able to check for a draw, and return a message" do
    moves  = [:x,:o,:x,
              :x,:o,:o,
              :o,:x,:x]
    expect(gameover.check(moves, players, turn)).to eq("DRAW")
  end
end
