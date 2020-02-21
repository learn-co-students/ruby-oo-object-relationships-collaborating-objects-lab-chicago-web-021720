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

    def self.new_by_filename(fn)
        artiste, name = fn.match(/(.+) - (.+) - .+\.mp3/).to_a.last(2)
        song = self.new(name)
        song.artist_name = artiste
        song
    end

    def artist_name=(name)
        rez = Artist.find_or_create_by_name(name)
        rez.add_song(self)
    end



end