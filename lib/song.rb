require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_name_array = file_name.split(/[\-\.]/)
    artist_name = file_name_array[0] = file_name_array[0][0..-2]
    name = file_name_array[1] = file_name_array[1][1..-1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def create_from_filename(file_name)
    file_name_array = file_name.split(/[\-\.]/)
    artist_name = file_name_array[0] = file_name_array[0][0..-2]
    name = file_name_array[1] = file_name_array[1][1..-1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

end
