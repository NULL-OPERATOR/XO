require_relative "../app/models/ai"
require_relative "../app/models/node"

describe AI do
  let(:ai)    { described_class.new(node: node) }
  let(:node)  { Node }
  let(:rules) { class_double("Rules", win_conditions: win_conditions)}

  context "winning moves: " do
    it "should anticipate a winning move, and play it" do
      moves  = [:x,:x,:-,:-,:x,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :x
      expect(ai.move(input_node, player)).to eq(2)
    end

    it "blocks an oppoents winning move" do
      moves  = [:x,:x,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(2)
    end
  end

  context "initial moves: " do
    it "takes a corner as the first move" do
      moves  = [:-,:-,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(0)
    end

    it "takes the center when the second move" do
      moves  = [:x,:-,:-,:-,:-,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(4)
    end
  end

  context "forking and blocking forks: " do
    it "forks when X has corner and O has center " do
      moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:-]
      input_node = node.new(moves: moves)
      player = :x
      expect(ai.move(input_node, player)).to eq(1)
    end

    it "blocks diagonal fork with a side" do
      moves  = [:x,:-,:-,:-,:o,:-,:-,:-,:x]
      input_node = node.new(moves: moves)
      player = :o
      expect(ai.move(input_node, player)).to eq(1)
    end
  end
end
