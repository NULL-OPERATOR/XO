require 'sinatra/base'
require './app/models/game_setup'

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

  get '/game/:choice' do
    session[:game].turn(params[:choice].to_i)
    redirect :game
  end

  # get '/*' do
  #   redirect '/'
  # end

end
