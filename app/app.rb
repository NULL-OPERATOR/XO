require 'sinatra/base'
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
    p session[:game]
    @game = session[:game]
    erb :game
  end

  post '/game/:choice' do
    params[:choice]
    redirect '/game'
  end

  get '/*' do
    redirect '/'
  end

end
