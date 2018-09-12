require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    text_from_user = params[:user_phrase]
    @pig_text = PigLatinizer.new()
    @translated_text = @pig_text.piglatinize(text_from_user)
    erb :piglatinize
  end

end
