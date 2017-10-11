require('pg')
class Album
  attr_reader :id, :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['name']
  end
end
