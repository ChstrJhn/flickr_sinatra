post '/upload' do
	@album = Album.find(params[:album][:id])
	@user = current_user
	@photo_details = params[:new_photo]
    @new_photo = Photo.create(@photo_details)
    @album.photos << @new_photo
    @user.photos << @new_photo
	redirect '/'
end