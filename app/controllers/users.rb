before do
  @user = check_login
end

get '/user/signup' do
  erb :signup
end

post '/user/signup' do
  @user = User.new(params)

  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = "What the heck man..."
    erb :signup
  end
end

post '/user/login' do
  login
  redirect '/'  
end

get '/user/logout' do
  session.clear
  redirect '/'
end

get '/user/profile' do
  erb :profile
end

