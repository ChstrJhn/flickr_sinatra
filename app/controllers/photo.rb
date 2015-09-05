post '/upload' do
	@album = Album.find(params[:album][:id])
	@user = current_user
	@photo_details = params[:new_photo]
    @new_photo = Photo.create(@photo_details)
    @album.photos << @new_photo
    @user.photos << @new_photo
	redirect '/'
end

delete '/my_albums/:album_id/photo/:photo_id/delete' do
	@unwanted_photo = Photo.find(params[:photo_id])
	@album = Album.find(params[:album_id])
	@unwanted_photo.destroy
	redirect "/my_albums/#{@album.id}"
end