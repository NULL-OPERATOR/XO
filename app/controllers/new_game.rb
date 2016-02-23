class XO < Sinatra::Base
  use Rack::Session::Pool

  post '/new' do
    game = GameSetup.new
    players = params[:mode].split(",")
    session[:game] = game.start_game(players)
    redirect '/game'
  end

end
