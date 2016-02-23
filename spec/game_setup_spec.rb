require_relative "../app/models/game_setup"

describe GameSetup do
  let(:grid)    { class_double("Grid") }
  let(:rules)   { class_double("Rules") }
  let(:ai)      { class_double("AI") }
  let(:game)    { spy("Game") }
  let(:setup)   { described_class.new(game, grid, rules, ai) }
  let(:players) { instance_double("players") }

  it "should initialize with a game" do
    expect(setup.game).to eq(game)
  end

  it "should initialize with a grid" do
    expect(setup.grid).to eq(grid)
  end

  it "should initialize with rules" do
    expect(setup.rules).to eq(rules)
  end

  it "should initialize a game" do
    setup.start_game(players)
    expect(game).to have_received(:new)
  end
end
