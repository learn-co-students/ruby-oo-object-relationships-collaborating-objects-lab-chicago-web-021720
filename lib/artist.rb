class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        instance_arr = Artist.all.select do |artist| 
            artist.name == name
        end
        if instance_arr.size == 0
            Artist.new(name)
        else
            instance_arr[0]
        end
    end

    def print_songs
        self.songs.map { |song| puts song.name }
    end

end