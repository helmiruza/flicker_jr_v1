enable :sessions

post '/album/:id/upload' do |id|
	@album = Album.find_by(id: id)
	Photo.create(filename: params[:filename], album_id: @album.id)

	redirect to "/album/#{@album.id}"
  # File.open(File.join(APP_ROOT,'public','uploads', params[:thefile][:filename]), "w") do |f|
  #   f.write(params[:thefile][:tempfile].read)
  # end
  # return "The file was successfully uploaded!"
end

get '/upload' do
	erb :upload
end

get '/album/:albumid/:photoid' do |photoid|
	byebug
	@album = Album.find_by(id: albumid)
	@photo = @album.photos.find_by(id: photoid)

	erb :photofullview
end