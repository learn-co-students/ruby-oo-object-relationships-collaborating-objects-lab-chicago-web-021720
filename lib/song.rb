class Song
    attr_accessor :name
    attr_reader :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        artist.songs << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
    
    def self.new_by_filename(filename)
        split_filename = filename.split(" - ")
        song = self.new(split_filename[1])
        song.artist_name=(split_filename[0])
        song
    end
end