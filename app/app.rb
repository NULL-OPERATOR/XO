ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require './app/models/game_factory'

class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    erb :index
  end

  post '/new' do
    players = params[:players]
    redirect '/' if players == nil
    session[:game] = GameFactory.build(players)
    redirect '/game'
  end

  get '/game' do
    game = session[:game]
    redirect '/' unless game
    @winner  = game.winner
    @ai_next = game.ai_next?
    @moves   = game.moves
    @choice  = game.current_choice
    erb :game
  end

  get '/player/:move' do
    move = params[:move].to_i
    session[:game].game_move(move)
    redirect '/game'
  end

  # get '/ai_move' do
  #   session[:game].game_move(move)
  #   redirect '/game'
  # end

  get '/*' do
    redirect '/'
  end
end
