ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require './app/models/game_setup'

# require_relative 'controllers/index'
# require_relative 'controllers/new_game'
# require_relative 'controllers/game'
# require_relative 'controllers/game_move'

class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    erb :index
  end

  post '/new' do
    game = GameSetup.new
    players = params[:mode].split(",")
    session[:game] = game.start_game(players)
    redirect '/game'
  end

  get '/game' do
    redirect '/' unless session[:game]
    @game = session[:game]
    erb :game
  end

  get '/player/:move' do
    move = params[:move].to_i
    session[:game].player_move(move)
    redirect '/game'
  end

  get '/ai_move' do
    session[:game].ai_move
    redirect '/game'
  end

  get '/*' do
    redirect '/'
  end

  # helpers do
  #   def ai_next
  #     session[:game].turn[:choice] == 'c'
  #   end
  # end




end
