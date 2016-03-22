require_relative "../app/models/game_node"

describe GameNode do
  let(:game)    { described_class.new(players: players,
                                      ai:      ai,
                                      moves:   moves) }
  let(:players) { [player1, player2] }
  let(:player1) { { player: :p, choice: :x } }
  let(:player2) { { player: :c, choice: :o } }
  let(:ai)      { instance_double("AI", move: 2) }
  let(:moves)   { [:-,:-,:-,:-,:-,:-,:-,:-,:-] }

  it "should have be able to make a move" do
    game.game_move(3)
    expect(game.moves[3]).to eq :x
  end

  it "shoud check if the ai is next" do
    game.game_move(2)
    expect(game.ai_next?).to be(true)
  end

  it "should not change moves if the move is taken on the players turn" do
    game.game_move(1)
    game.game_move(2)
    expect{ game.game_move(1) }.not_to change{ game.moves }
  end

  it "should switch player after a move is made" do
    game.game_move(1)
    expect(game.turn).not_to eq(player1)
  end

  it "should be able to make an ai move" do
    game.game_move(4)
    game.game_move(4)
    expect(game.moves[2]).to eq :o
  end

  it "should check and return the current choice" do
    expect(game.current_choice).to eq :X
  end

end
