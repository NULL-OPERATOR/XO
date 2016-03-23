require_relative "../app/models/game_factory"

describe GameFactory do
  let(:game_factory) { described_class.build(players, game, ai, node) }
  let(:ai)           { spy("AI") }
  let(:game)         { spy("Game") }
  let(:node)         { spy("Node") }
  let(:players)      { "player,x,player,o" }

  it "should initialize an ai" do
    new_setup = GameFactory.build(players, game, ai, node)
    expect(ai).to have_received(:new)
  end

  it "should initialize a game" do
    game_factory.new_game(players, game, ai, node)
    expect(game).to have_received(:new)
  end
end
