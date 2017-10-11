require('pg')
class Album
  attr_accessor :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING *"
    values  = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    classified_albums = albums.map {|album| Album.new(album)}
    return classified_albums
  end

  def show_albums()
    sql = "SELECT * FROM ALBUMS WHERE artist_id = $1"
    values = [@artist_id]
    album = SqlRunner.run(sql, values)
    classified_album = album.map {|this_album| Album.new(this_album)}
    return classified_album
  end
end
