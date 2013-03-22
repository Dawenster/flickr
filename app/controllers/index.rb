get '/' do
  @albums = Album.all
  erb :index
end



get '/public/uploads/:url' do
  @params[:url]
end
