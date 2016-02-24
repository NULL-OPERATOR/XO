require_relative "game"
require_relative "grid"
require_relative "rules"
require_relative "ai"

class GameSetup
  attr_reader :game, :grid, :rules
  def initialize(game = Game, grid = Grid, rules = Rules, ai = AI)
    @game  = game
    @grid  = grid
    @rules = rules
    @ai    = ai
  end

  def new_game(players)
    @game.new(@grid, @rules, players, @ai)
  end

  private

    # def setup_player_status(players)
    #   @p1 = { player: players[0], choice: players[1], win: false}
    #   @p2 = { player: players[2], choice: players[3], win: false}
    #   @turn = @p1
    # end
end
