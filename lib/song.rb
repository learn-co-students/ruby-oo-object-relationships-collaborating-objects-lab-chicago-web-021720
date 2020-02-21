require_relative 'artist'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end

    def self.new_by_filename(file_name)
        artist_name, song_name, _ = parse_filename(file_name)
        new_song = self.new(song_name)
        new_song.artist_name = artist_name
        new_song
    end

    def self.all
        @@all
    end

    private

    def self.parse_filename(file_name)
        file_name.split(' - ')
    end

end
