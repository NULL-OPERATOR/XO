require_relative "../app/models/node"

describe Node do
  let(:node) { described_class.new(moves: moves) }
  let(:moves) { Array.new(9) { :- } }

  it "should be able to make a move and store it" do
    node.make_move(:x, 1)
    expect(node.moves[1]).to eq(:x)
  end

  it "set the winner after a winning move is made" do
    [0,1,2].each do |i|
      node.make_move(:x, i)
    end
    expect(node.winner).to be :x
  end

  it "set the winner as draw if board is full" do
    moves = [:x, :o, :x, :x, :o, :o, :o, :x, :-]
    draw_node = Node.new(moves: moves)
    draw_node.make_move(:x, 8)
    expect(draw_node.winner).to be :draw
  end
end
