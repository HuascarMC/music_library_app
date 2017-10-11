require('pg')

class Artist
  def initilalize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @title = options['title']
  end
end
