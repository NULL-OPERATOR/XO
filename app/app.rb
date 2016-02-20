ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/game_setup'
require 'tilt/erb'

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
    if session[:game]
      @game = session[:game]
      erb :game
    else
      redirect '/'
    end
  end

  get '/game/:move' do
    move = params[:move].to_i
    session[:game].try_move(move)
    redirect '/game'
  end

  # get '/*' do
  #   redirect '/'
  # end

end
