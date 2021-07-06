class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        parsed = file.split(" - ")
        song_name = parsed[1]
        song = Song.new(song_name)
        song.artist = Artist.find_or_create_by_name(parsed[0])
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end