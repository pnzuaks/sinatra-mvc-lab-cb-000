require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/' do
    text_from_user = params[:user_text]
    @pig_text = Piglatinizer.new(text_from_user)
    @translated
    erb :results
  end

end
