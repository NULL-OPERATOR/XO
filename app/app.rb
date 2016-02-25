ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require './app/models/game_setup'

class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    session[:setup] = GameSetup.new
    erb :index
  end

  post '/new' do
    players = params[:players]
    redirect '/' if players == nil
    session[:game] = session[:setup].new_game(players)
    redirect '/game'
  end

  get '/game' do
    game = session[:game]
    redirect '/' unless game
    @over    = game.over
    @ai_next = game.ai_next?
    @moves   = game.moves
    @turn    = game.current_turn
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
