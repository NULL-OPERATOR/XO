require_relative "../app/models/ai"

describe AI do
  let(:ai)    { described_class.new(node) }
  let(:node)  { class_double("Node")}
  let(:rules) { class_double("Rules", win_conditions: win_conditions)}

  context "winning moves: " do
    # it "should anticipate a winning move, and play it" do
    #   moves  = [:x,:x,:-,:-,:-,:-,:-,:-,:-]
    #   player = :x
    #   expect(ai.make_move(player, move)).to eq(2)
    # end


    #
    # it "should block an oppoents winning move" do
    #   moves  = [:x,:x,:-,:-,:-,:-,:-,:-,:-]
    #   player = :o
    #   expect(ai.move(moves, player)).to eq(2)
    # end
  end

  # context "initial moves: " do
  #   it "should take a corner when the first move" do
  #     moves  = [:-,:-,:-,:-,:-,:-,:-,:-,:-]
  #     player = :o
  #     expect(ai.move(moves, player)).to eq(0)
  #   end
  #
  #   it "should take the center when the second move and hasn't been taken" do
  #     moves  = [:x,:-,:-,:-,:-,:-,:-,:-,:-]
  #     player = :o
  #     expect(ai.move(moves, player)).to eq(4)
  #   end
  # end
  #
  # context "forking and blocking forks: " do
  #   it "should try to create a fork when X has corner and O has center " do
  #     moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:-]
  #     player = :x
  #     expect(ai.move(moves, player)).to eq(8)
  #   end
  #
  #   it "should block the diagonal fork with a side" do
  #     moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:x]
  #     player = :o
  #     expect(ai.move(moves, player)).to eq(1)
  #   end
  #
  #   it "should block the cheeky corner fork1" do
  #     moves  = [:-,:-,:-,
  #               :-,:o,:x,
  #               :-,:x,:-]
  #     player = :o
  #     expect(ai.move(moves, player)).to eq(8)
  #   end
  #
  #   it "should block the side/corner fork2" do
  #     moves  = [:-,:-,:x,
  #               :-,:o,:-,
  #               :-,:x,:-]
  #     player = :o
  #     expect(ai.move(moves, player)).to eq(8)
  #   end
  # end

end
