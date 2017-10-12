require_relative('artists.rb')
require_relative('../db/sql_runner.rb')
require('pg')
class Album
  attr_accessor :id, :artist_id
  attr_reader :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
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

  def show_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    Artist.new(SqlRunner.run(sql, values)[0])
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)[0]
    # classified_album = album_array.map {|album| Album.new(album)}
    # return classified_album[0]
  end
end

# Index out of range, make sure SQL is RETURNING something.
# Implicit conversion of string into integer, make sure everything is turned '.to_i' where it has to.
#
#
