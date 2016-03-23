require_relative "ai"
require_relative "game"
require_relative "node"

class GameFactory
  def self.build(config, game_class = Game, ai_class = AI, node_class = Node)
    game_class.new(
      players: players(config),
      ai:      ai_class.new(node: node_class),
      node:    node_class.new(moves: moves))
  end

  private

  def self.players(config)
    input = config.split(",").map{ |x| x.to_sym }
    [
      { player: input[0], choice: input[1] },
      { player: input[2], choice: input[3] }
    ]
  end

  def self.moves
    Array.new(9) { :- }
  end
end
