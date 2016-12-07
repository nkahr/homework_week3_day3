require('pg')

class Artist

  attr_reader :name, :id

  def initialize(artist_hash)
    @id = artist_hash['id'] unless artist_hash['id'].nil?
    @name = artist_hash
  end

  def save()
    sql = "INSERT INTO artists_table (name) VALUES ('#{@name}') RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i()
  end

  def self.show_all()
    sql = "SELECT * FROM artists_table;"
    SqlRunner.run(sql)
  end



end 