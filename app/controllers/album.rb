enable :sessions

post '/album/new' do
	@user = User.find_by(id: session[:user_id])
	@album = Album.create(name: params[:albumname], filename: params[:filename], user_id: @user.id)

	redirect to "/album/#{@album.id}"
end

get '/album/:id' do |id| 
	@album = Album.find_by(id: id)
	session[:album_id] = @album.id

	erb :album
end