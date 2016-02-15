require "spec_helper"
require "game_setup"

describe GameSetup do
  let(:grid)   { class_double("Grid") }
  let(:game)   { spy("Game") }
  let(:setup)  { described_class.new(game, grid) }
  let(:player) { instance_double("player") }

  it("should be able to set players") do
    setup.set_players(player, player)
    expect(setup.p1).to eq(player)
  end

  it("should initialize a game") do
    setup.start_game
    expect(game).to have_received(:new)
  end
end
