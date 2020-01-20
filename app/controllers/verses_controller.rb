class VersesController < ApplicationController

    get "/user/verses" do
        @verse = Verse.all
        erb :"/verses/index.html"
    end 

    get '/user/verses/new' do 
        erb :"/verses/new.html"
    end 

    get "/user/verses/:id" do
        @verse = Verse.find(params[:id])
        erb :"/verses/post_verse_page"
    end

    post '/user/verses' do
        @verse = Verse.create(title: params[:title], content: params[:content])
        redirect '/'
    end

    patch '/user/verses/:id' do
        @verse = Verse.find(params[:id])
        @verse.update(title: params[:title], content: params[:content])
        @verse.save
        redirect '/verses/' +params[:id]
    end 

    delete '/user/verses/:id' do
        @verse = Verse.find(params[:id])
        @verse.destroy
        redirect '/'
    end
end 