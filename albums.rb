require_relative('database/sql_runner.rb')
require_relative('artists.rb')
require('pg')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize(album_hash)
    @id = album_hash['id'] unless album_hash['id'].nil?
    @title = album_hash['title']
    @genre = album_hash['genre']
    @artist_id = album_hash['artist_id']
  end

  def save()
    sql = "INSERT INTO albums_table (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i()
  end

  def self.show_all()
    sql = "SELECT * FROM albums_table;"
    return SqlRunner.run(sql).map{|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums_table;" 
    SqlRunner.run(sql)
  end

  def show_artist()
    sql = "SELECT * FROM artists_table WHERE id = #{@artist_id};"
    return Artist.new(SqlRunner.run(sql)[0])
  end

  def update_album()
    sql = "UPDATE albums_table SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete_album()
    sql = "DELETE FROM albums_table WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Album.find_album_by_album_id(id)
    sql = "SELECT * FROM albums_table WHERE id = #{id};"
    return Album.new(SqlRunner.run(sql)[0])
  end

  def Album.find_albums_by_artist_id(artist_id)
    sql = "SELECT * FROM albums_table WHERE artist_id = #{artist_id};"
    return SqlRunner.run(sql).map{|album| Album.new(album)}
  end
end