class XO < Sinatra::Base
  use Rack::Session::Pool

  get '/' do
    erb :index
  end
end
