get '/' do
  @albums = Album.all
  erb :index
end


