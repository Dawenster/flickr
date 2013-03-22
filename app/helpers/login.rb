helpers do 

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] = @user.id
    else
      redirect '/user/login'
    end
  end

  def check_login
    @user = User.find(session[:id]) if session[:id]
  end

end
