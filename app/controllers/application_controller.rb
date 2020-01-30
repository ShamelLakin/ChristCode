require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public' #Styling
    set :views, 'app/views' #view templates
    enable :sessions #Allowing us to keep track of user state
    set :session_secret, 'john_3_16' #Protect from hackers unauthorized users random hex number
  end

  get "/" do
    if logged_in?
      redirect '/users/home'
    else
      erb :'/root/index.html' #User should see starter page unless logged in
    end
  end

  helpers do 

    def logged_in?
      Helper.logged_in?(session) #checking to see who session belongs to
    end 

    def current_user
      Helper.current_user(session) #finding current user
    end

  end 

end
