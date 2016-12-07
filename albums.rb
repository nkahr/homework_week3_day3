require_relative('database/sql_runner.rb')
require('pg')

class Album

  attr_reader :id, :title, :genre

  def initialize(album_hash)
    @id = album_hash['id'] unless album_hash['id'].nil?
    @title = album_hash['title']
    @genre = album_hash['genre']
  end

  def save()
    sql = "INSERT INTO albums_table (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i()
  end

  def show_all()
    sql = "SELECT * FROM albums_table;"
    SqlRunner.run(sql)
  end
  
end