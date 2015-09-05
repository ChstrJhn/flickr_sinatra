post '/new_album' do
	@user = current_user
	@album_details = params[:new_album]
	@new_album = Album.create(@album_details)
	@user.albums << @new_album
	redirect '/userpage'
end

get '/my_albums' do
	@all_albums = Album.all
	erb :albums
end

get '/my_albums/:id' do
	@album_slideshow = "album_slideshow"
	@album = Album.find(params[:id])
	erb :single_album
end