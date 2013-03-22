get '/photo/new' do
  @albums = @user.albums
  erb :create_photo
end

post '/photo/new' do
  random_url = SecureRandom.urlsafe_base64(8)


  uploads_dir = File.join(APP_ROOT, "public", "uploads")
  my_filename = File.join(uploads_dir, random_url + params['filename'][:filename])

  File.open(my_filename, "w") do |f|
    @url = random_url + params['filename'][:filename]
    f.write(params['filename'][:tempfile].read)
  end

  image = MiniMagick::Image.open(my_filename)
  image.resize "100x100"
  thumb = "thumb" + @url
  image.write File.join(uploads_dir, thumb)

  Photo.create(:album_id => params[:album_id], :url => @url, :thumb => thumb)
  
  @albums = @user.albums
  @message = "The file was successfully uploaded!"

  erb :create_photo
end
