get '/album/new' do
  erb :create_album
end

post '/album/new' do
  params[:user_id] = @user.id
  @album = Album.create(params)
  erb :create_album
end

get '/album/:id' do
  @album = Album.find(params[:id])
  @photos = @album.photos
  erb :album
end
