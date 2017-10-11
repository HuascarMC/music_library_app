require('pg')

class Artist
  def initilalize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['name']
  end
end
