class UserController < ApplicationController

    get '/users/home' do 
        @user = User.find_by(username: session[:username])
        
        erb :'/users/home.html'
      end
      
      get '/signup' do
          erb :'/users/new.html'
      end
    
      post '/signup' do 
          @user = User.new(params)
          if @user.save 
              session[:username] = @user.username
              binding.pry
              redirect '/users/home'
          else
              erb :'/users/new.html'
          end
      end
    
    
      get '/login' do 
          erb :'/users/login.html'
      end
    
      post '/login' do 
          @user = User.find_by(username: params[:username])
          if @user && @user.authenticate(params[:password])
              session[:username] = @user.username
              # binding.pry
              redirect '/users/home'
          else
              erb :'/users/login.html'
          end
      end
    
      get '/logout' do 
          session.clear
          redirect '/login'
      end
    
end 