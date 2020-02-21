class Artist
    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
    end

    def self.find_or_create_by_name(name)
        if self.all.find {|artist| artist.name == name}
            return self.all.find {|artist| artist.name == name}
        else
            self.new(name)
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end