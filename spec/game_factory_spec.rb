require_relative "../app/models/game_factory"

describe GameFactory do
  let(:game_factory) { described_class.build(players, game_node, ai) }
  let(:ai)           { spy("AI") }
  let(:game_node)    { spy("GameNode") }
  let(:players)      { "p,x,p,o" }

  it "should initialize an ai" do
    new_setup = GameFactory.build(players, game_node, ai)
    expect(ai).to have_received(:new)
  end

  it "should initialize a game node" do
    game_factory.new_game(players, game_node, ai)
    expect(game_node).to have_received(:new)
  end
end
