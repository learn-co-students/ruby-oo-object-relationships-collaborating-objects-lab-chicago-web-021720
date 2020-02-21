require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist
  attr_reader :artist_name

  def artist_name=(artist_name)
     @artist_name = artist_name
     @artist = Artist.find_or_create_by_name(artist_name)
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    comps = file_name.split(' - ')
    artist_name = comps[0]
    song_name = comps[1]
    newsong = Song.new(song_name)
    newsong.artist_name = artist_name
    newsong.artist = Artist.find_or_create_by_name(artist_name)
    newsong
  end

end
