require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'john_3_16'
  end

  get "/" do
    erb :'index.html'
  end

  helpers do 

    def logged_in?
      !!session[]
    end 

  end 

end
