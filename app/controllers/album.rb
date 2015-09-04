post '/new_album' do
	@album_details = params[:new_album]
	@new_album = Album.create(@album_details)
	redirect '/userpage'
end

get '/my_albums' do
	@all_albums = Album.all
	erb :albums
end

get '/my_albums/:id' do
	@album = Album.find(params[:id])
	erb :single_album
end