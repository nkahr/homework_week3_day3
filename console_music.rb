require_relative('albums.rb')
require_relative('artists.rb')
require('pry')


Album.delete_all
Artist.delete_all # has dependencies


artist1 = Artist.new({"name" => "Radiohead"})
artist1.save()
album1a = Album.new({"title" => "Hail to the Thief", "genre" => "alternative rock", "artist_id" => artist1.id})
album1a.save()
album1b = Album.new({"title" => "A Moon Shaped Pool", "genre" => "alternative rock", "artist_id" => artist1.id})
album1b.save()


artist2 = Artist.new({"name" => "Eels"})
artist2.save()
album2a = Album.new({"title" => "Hombre Lobo", "genre" => "indie rock", "artist_id" => artist2.id})
album2a.save()
album2b = Album.new({"title" => "Wonderful, Glorious", "genre" => "indie rock", "artist_id" => artist2.id})
album2b.save()


artist3 = Artist.new({"name" => "Daughter"})
artist3.save()
album3a = Album.new({"title" => "If You Leave", "genre" => "indie folk", "artist_id" => artist3.id})
album3a.save()


artist4 = Artist.new({"name" => "Rhye"})
artist4.save()
album4 = Album.new({"title" => "Woman", "genre" => "R&B", "artist_id" => artist4.id})
album4.save()

binding.pry
nil