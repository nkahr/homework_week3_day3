require('pg')
class SqlRunner

  def self.run(sql_statement)
    begin #if there is an error in begin, still moves on to ensure part
      db = PG.connect({dbname: "musicdb", host: "localhost"})
      result = db.exec(sql_statement)
    ensure
      db.close()
    end
    return result
  end

end
