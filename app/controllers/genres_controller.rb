class GenreController < ApplicationController

  get '/genres' do 
      @artists = Genre.all 
      erb :'/genre/index'
  end 

  get '/genres/:slug' do
      @genre = Genre.find_by_slug(params[:slug])
      erb :'/genre/show'
  end 
  

end
