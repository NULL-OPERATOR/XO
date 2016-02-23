ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require './app/models/game_setup'

class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    erb :index
  end

  post '/new' do
    setup = GameSetup.new
    players = params[:players].split(",")
    p players
    session[:game] = setup.new_game(players)
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
end
