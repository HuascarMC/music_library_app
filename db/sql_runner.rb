require('pg')

class SqlRunner
  def self.run(sql, values)
    begin
    db = PG.connect({
      dbname: 'music_library',
      host: 'localhost'
      })
      db.prepare("query", sql)
      result = db.exec_prepare("query", values)
    ensure
      db.close
    end
    return result
  end
end
