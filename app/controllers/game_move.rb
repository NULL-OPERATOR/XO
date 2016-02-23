class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/game/:move' do
    move = params[:move].to_i
    session[:game].try_move(move)
    redirect '/game'
  end
end
