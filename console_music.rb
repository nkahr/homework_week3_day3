require_relative('albums.rb')
require_relative('artists.rb')
require('pry')




test_artist = Artist.new({"name" => "Artist name"})




test_album = Album.new({"name" => "Album Name", "genre" => "Genre", "artist_id" => test_artist.id()})





binding.pry
nil