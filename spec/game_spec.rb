require_relative "../app/models/game"

describe Game do
  let(:game)    { described_class.new(players: players,
                                      ai:      ai,
                                      node:    node) }
  let(:players) { [player1, player2] }
  let(:player1) { { player: :player, choice: :x } }
  let(:player2) { { player: :computer, choice: :o } }
  let(:ai)      { instance_double("AI", move: 2) }
  let(:node)    { instance_double("Node",
                                  make_move: 2,
                                  moves: [2],
                                  winner: false) }
  before do
    allow(node).to receive(:move_available?).and_return(:true)
  end

  it "can make a move" do
    game.game_move(2)
    expect(game.moves).to eq [2]
  end

  it "checks if the ai is next" do
    game.game_move(2)
    expect(game.ai_next?).to be true
  end

  it "switches the player after a move is made" do
    game.game_move(1)
    expect(game.turn).not_to eq player1
  end

  it "reutns the current players choice" do
    expect(game.current_choice).to eq :X
  end

  it "gets the node winner status" do
    expect(game.winner).to eq false
  end

  it "gets the game_nodes moves" do
    expect(game.moves).to eq [2]
  end
end
