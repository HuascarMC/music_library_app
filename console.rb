require('pry')
require_relative('models/albums.rb')
require_relative('models/artists.rb')

artist_1 = Artist.new ({
  'name' => 'Margaret'
  })

artist_2 = Artist.new ({
  'name' => 'Uncle Sam'
  })

album_1 = Album.new ({
  'title' => 'Mag and Chicks',
  'genre' => 'Bagwurk-Pop',
  'artist' => artist_1.id
  })

album_2 = Album.new ({
  'title' => 'McDonald',
  'genre' => 'Fries',
  'artist' => artist_2.id
  })

binding.pry
nil
