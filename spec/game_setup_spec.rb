require "spec_helper"
require "game_setup"

describe GameSetup do
  let(:setup)  { described_class.new }
  let(:player) { double(:player) }

  it("should be able to set players") do
    setup.set_players(player, player)
    expect(setup.p1).to eq(player)
  end
end


# describe GameSetup do
#   let(:setup) { class_double(:GameSetup) }
#   let(:grid) { class_double(:grid) }
#
#   it("should be able to set a player with choice")
#
#
#   it("should return game with 0, when 2 humans") do
#     mode = [true, true]
#     let(:game) { Game.new(game, mode, grid) }
#     expect
#   end
#       # expect(game.player2).to be("human")
# end
