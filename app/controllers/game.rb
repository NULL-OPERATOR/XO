class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/game' do
    redirect '/' unless session[:game]
    redirect '/game/0' if  ai_next?
    @game = session[:game]
    erb :game
  end

end
