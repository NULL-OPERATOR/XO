require 'sinatra/base'
require './app/models/game_setup'

class XO < Sinatra::Base

  get '/' do
    @game = GameSetup.new
    erb :game_start
  end
end
