require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'john_3_16'
  end

  get "/" do
    if !logged_in?
    erb :'index.html'
    else 
      redirect 
    end
  end

  helpers do 

    def logged_in?
      !!session[:user_id]
    end 

  end 

end
