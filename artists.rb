require('pg')
require_relative('database/sql_runner.rb')
require_relative('albums.rb')

class Artist

  attr_accessor :name, :id

  def initialize(artist_hash)
    @id = artist_hash['id'] unless artist_hash['id'].nil?
    @name = artist_hash['name']
  end

  def save()
    sql = "INSERT INTO artists_table (name) VALUES ('#{@name}') RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.show_all()
    sql = "SELECT * FROM artists_table;"
    return SqlRunner.run(sql).map{|artist| Artist.new(artist)}
  end

  def show_albums()
    sql = "SELECT * FROM albums_table WHERE artist_id = #{@id};"
    return SqlRunner.run(sql).map{|album| Album.new(album)}
  end

  def update_artist()
    sql = "UPDATE artists_table SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete_artist()
    sql = "DELETE FROM artists_table WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def find_artist_by_id(id)
    sql = "SELECT * FROM artists_table WHERE id = #{id};"
    return Artist.new(SqlRunner.run(sql)[0])
  end

end 