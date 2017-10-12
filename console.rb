require('pry')
require_relative('models/artists.rb')
require_relative('models/albums.rb')

artist_1 = Artist.new ({
  'name' => 'Margaret'
  })

artist_2 = Artist.new ({
  'name' => 'Uncle Sam',
  })

artist_1.save()
artist_2.save()


album_1 = Album.new ({
  'title' => 'Mag and Chicks',
  'genre' => 'Bagwurk-Pop',
  'artist_id' => artist_1.id
  })

album_2 = Album.new ({
  'title' => 'McDonald',
  'genre' => 'Fries',
  'artist_id' => artist_2.id
  })

album_3 = Album.new ({
  'title' => 'The farmer\'s wife',
  'genre' => 'Heavey metal',
  'artist_id' => artist_1.id
  })


album_1.save()
album_2.save()

binding.pry
nil
