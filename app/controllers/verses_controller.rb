class VersesController < ApplicationController

    get "/users/verses" do
        @verses = Verse.all
        erb :"/verses/index.html"
    end 

    
    
    get '/users/verses/new' do # => check to see if your routes are pointing to the right file
        if logged_in?
            @verse = Verse.new
            erb :"/verses/new.html"
        else
            redirect '/login'
        end 
    end
    
    post '/users/verses' do
        @verse = Verse.new
        @verse.title = params[:title]
        @verse.content = params[:content]
        if @verse.save 
            redirect "/users/verses/#{@verse.id}"
        else
            erb :"/verses/new.html"
        end
    end
    
    get "/users/verses/:id" do |id|
        @verse = Verse.find_by_id(id) #perhaps access by :user_id or :username?
        erb :"/verses/show.html"
    end

    get "/users/verses/:id/edit" do |id|
        if logged_in?
            @verse = Verse.find_by_id(id)
            erb :"/verses/edit.html"
        else
            redirect "/login"
        end
    end

    patch '/users/verses/:id' do |id|
        @verse = Verse.find_by_id(id)
        @verse.title = params[:title]
        @verse.content = params[:content]
        if @verse.save
            redirect "/verses/#{id}" 
        else
            erb :"/verses/edit.html"
        end
    end 

    delete '/users/verses/:id' do |id|
        @verse = Verse.find_by_id(id)
        @verse.destroy
        redirect '/users/home'
    end
end 