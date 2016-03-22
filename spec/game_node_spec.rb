require_relative "../app/models/game_node"

describe GameNode do
  let(:game)    { described_class.new(players: players,
                                      ai:      ai,
                                      moves:   moves) }
  let(:ai)      { instance_double("AI", move: 2) }
  let(:players) { [player1, player2] }
  let(:moves)   { Array.new(9) { :- } }
  # let(:player1) { { player: :p, choice: :x } }
  # let(:player2) { { player: :p, choice: :o } }

  # it "should initialize an array of empty moves, of grid length" do
  #   expect(game.moves).to eq(moves)
  # end

  # it "should be able to switch a player" do
  #   game.switch_player
  #   expect(game.turn).to eq(player2)
  # end
  #
  # it "shoud check if the ai is next" do
  #   new_players = [ { player: :c, choice: :x }, player2 ]
  #   new_game = Game.new(game_over, new_players, ai)
  #   expect(new_game.ai_next?).to be(true)
  # end
  #
  # it "should call game_over to check if the game is over" do
  #   expect(game.over).to be(true)
  # end
  #
  # it "should be able to make a move and store it" do
  #   game.player_move(1)
  #   expect(game.moves[1]).to eq(:x)
  # end
  #
  # it "should not change moves if the move is taken" do
  #   game.player_move(1)
  #   expect{ game.player_move(1) }.not_to change{ game.moves }
  # end
  #
  # it "should switch player on the second move" do
  #   game.player_move(1)
  #   expect(game.turn).not_to be(player1)
  # end
  #
  # it "should be able to make an ai move" do
  #   game.ai_move
  #   expect(game.moves[2]).to eq(:x)
  # end

end
