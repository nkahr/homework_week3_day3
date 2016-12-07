require_relative('albums.rb')
require_relative('artists.rb')
require('pry')




test_artist = Artist.new({"name" => "Artist name"})
test_artist.save()



test_album = Album.new({"title" => "Album Name", "genre" => "Genre", "artist_id" => test_artist.id})
test_album.save()




binding.pry
nil