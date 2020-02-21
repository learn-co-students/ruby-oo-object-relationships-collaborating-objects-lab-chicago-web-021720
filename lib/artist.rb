
class Artist
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end
  def self.all
    @@all
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def add_song(song)
    song.artist = self
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(name)
    found = @@all.find do |artist|
      artist.name == name
    end
    if found
      return found
    else
      newartist = Artist.new(name)
      return newartist
    end
  end
end
