enable :sessions

get '/' do
  # Look in app/views/index.erb
  @user = User.find_by(id: session[:user_id])
  @allphotos = Photo.all
  @allalbums = Album.all
  
  erb :index
end

get '/register' do
	erb :register
end

post '/register' do
	user = User.create(params[:user])
	@errors = ["Registration complete. Please login"]
	redirect to "/"
end

get '/login' do
	erb :login
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])	
 
 if @user
 	session[:user_id] = @user.id
 	redirect to "/"
 else
 	@errors = ["Authentication failed. Try again"]
 	erb :login
 end

end

get '/logout' do
	session.clear
	redirect to "/"
end