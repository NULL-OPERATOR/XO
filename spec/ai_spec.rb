require_relative "../app/models/ai"
require_relative "../app/models/node"

describe AI do
  let(:ai)    { described_class.new(node: node) }
  let(:node)  { Node }
  # let(:node)  { class_double("Node")}
  let(:rules) { class_double("Rules", win_conditions: win_conditions)}

  context "winning moves: " do
    it "should anticipate a winning move, and play it" do
      moves  = [:x,:x,:-,:-,:x,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :x
      expect(ai.move(input_node, player)).to eq(2)
    end

    it "should block an oppoents winning move" do
      moves  = [:x,:x,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(2)
    end
  end

  context "initial moves: " do
    it "should take a corner when the first move" do
      moves  = [:-,:-,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(0)
    end

    it "should take the center when the second move and hasn't been taken" do
      moves  = [:x,:-,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(4)
    end
  end

  context "forking and blocking forks: " do
    it "should try to create a fork when X has corner and O has center " do
      moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :x
      expect(ai.move(input_node, player)).to eq(1)
    end

    it "should block the diagonal fork with a side" do
      moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:x]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(1)
    end
  end
end
