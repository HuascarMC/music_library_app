require_relative('albums.rb')
require_relative('../db/sql_runner.rb')
require('pg')
class Artist
  attr_accessor :id, :name

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

  # def show_albums()
  #   sql = "SELECT * FROM ALBUMS WHERE id = $1"
  #   values = [@id]
  #    Album.new(SqlRunner.run(sql, values)[0])
  # end
end
