get '/' do
  @all_photos = Photo.all
  erb :welcome
end

get '/login' do
  erb :login 
end

post '/login' do
@details = params[:login]
  user = User.find_by(name: @details[:name]).try(:authenticate, @details[:password])
  if user
    session[:user_id] = user.id
    redirect '/userpage'
  else
    redirect to ("/login?error=Username or password incorrect&name=" + @details[:name])
  end
end

get '/logout' do
	session.clear
	@all_photos = Photo.all
	erb :welcome
end

get '/signup' do
  erb :signup
end

get '/userpage' do
	@user = current_user
	@all_albums = @user.albums
	erb :userpage
end

post '/signup' do
	new_user = User.new(params[:signup])
	if new_user.save
		session[:user_id] = new_user.id
		redirect '/userpage'
	else
		redirect to ("/signup?error=Passwords do not match&name=#{params[:signup][:name]}")
	end
end