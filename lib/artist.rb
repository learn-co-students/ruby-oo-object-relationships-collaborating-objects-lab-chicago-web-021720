class Artist

    attr_accessor :name

    @@all = []

    def initialize(name = nil)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.find_all { |song| song.artist == self }
    end

    def self.find_or_create_by_name(name)
        rez = @@all.find { |artist| artist.name == name }
        rez ||= self.new(name)
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        Song.all.each {|song| puts song.name if song.artist == self }
    end

end