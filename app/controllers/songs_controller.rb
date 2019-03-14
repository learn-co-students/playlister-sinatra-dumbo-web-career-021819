require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do 
      @artists = Song.all 
      erb :'/song/index'
  end 

  get '/songs/new' do
    erb :'/song/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end 

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/show'
  end 

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(artist: Artist.find_or_create_by(name: params["Artist Name"]))
    @song.update(genre_ids: params[:genres])
    @song.update(name: params["Name"])
    @song.save
    # binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
