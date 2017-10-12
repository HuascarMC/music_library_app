require_relative('albums.rb')
require_relative('../db/sql_runner.rb')
require('pg')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    classified_artists = artists.map {|artist| Artist.new(artist)}
    return classified_artists
  end

  def show_albums()
    sql = "SELECT * FROM ALBUMS WHERE id = $1"
    values = [@id]
     Album.new(SqlRunner.run(sql, values)[0])
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    return  SqlRunner.run(sql, values)[0]
    # classified_artist = artist_array.map {|artist| Artist.new(artist)}
    # return classified_artist[0]
  end

# Another way to update

  def self.update(name, id)
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [name, id]
    SqlRunner.run(sql, values)
  end
end
