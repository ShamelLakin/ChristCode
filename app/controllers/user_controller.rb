class UserController < ApplicationController

    get '/users/home' do 
        if logged_in? && current_user
            @verses = Verse.all
            erb :'/users/home.html'
        else
            redirect "/login"
        end
    end
      
    get '/signup' do
        if logged_in?
            redirect "/users/home"
        else
            erb :'/users/signup.html'
        end
    end
    
    post '/signup' do 
        @user = User.new(params)
        if @user.save 
              session[:username] = @user.username
              redirect '/users/home'
        else
            erb :'/users/signup.html'
        end
    end
    
    
    get '/login' do 
        if logged_in?
            redirect "/users/home"
        else
            erb :'/users/login.html'
        end
    end
    
    post '/login' do 
        @user = User.find_by(username: params[:username]) #find if @user username exists 
        if @user && @user.authenticate(params[:password]) # along with the passowrd
            session[:username] = @user.username
            redirect '/users/home'
        else
            erb :'/users/login.html'
        end
    end
    
    get '/logout' do 
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/login'
        end
    end
    
end 