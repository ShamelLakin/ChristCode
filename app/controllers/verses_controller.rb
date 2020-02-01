class VersesController < ApplicationController

    get "/users/verses" do
        if logged_in?
            @verses = current_user.verses
            erb :"/verses/index.html"
        else
            erb :"/root/index.html"
        end
    end 

    # CREATE
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
        # making associations below
        # HAS MANY HAS PLURAL WORD AFTER DOT NOTATION
        # MAKE SURE TO CREATE THE TWO RELATIONSHIP
        @verse.user = current_user # BELONGS TO HAS SINGULAR WORD AFTER DOT NOTATION
        if @verse.save #true 
            redirect "/users/verses"
        else
            erb :"/verses/new.html"
        end
    end
    
    # READ(SHOW)
    get "/users/verses/:id" do |id|
        if logged_in? 
            @verse = Verse.find_by_id(id) #perhaps access by :user_id or :username?
            if current_user.verses.include?(@verse)
                erb :"/verses/show.html"
            end
        else 
            redirect "/"
        end
    end

    # UPDATE(EDIT)
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
            redirect "/users/verses/#{id}" 
        else
            erb :"/verses/edit.html"
        end
    end 

    # DESTROY
    delete '/users/verses/:id' do |id|
        @verse = Verse.find_by_id(id)
        @verse.destroy
        redirect '/users/verses'
    end
end 