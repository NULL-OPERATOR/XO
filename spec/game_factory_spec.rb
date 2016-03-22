require_relative "../app/models/game_factory"

describe GameFactory do
  let(:game_factory) { described_class.build(players) }
  let(:ai)      { spy("AI") }
  let(:game)    { spy("GameNode") }
  let(:players) { "p,x,p,o" }

  it "should initialize with a game" do
    expect(setup.game).to eq(game)
  end

  it "should initialize an ai" do
    new_setup = GameSetup.new(game, game_over, ai)
    expect(ai).to have_received(:new)
  end

  it "should initialize a game" do
    setup.new_game(players)
    expect(game).to have_received(:new)
  end
end
