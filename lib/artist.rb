require_relative ("song.rb")
require 'pry'
class Artist
    attr_accessor :name, :song, :songs

    @@all = []

    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        array = []
        for i in Song.all
            if i.artist == self
                array.push(i)
            end
        end
        array
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        for i in self.all 
            if i.name == name 
                artist = i 
            end
        end
        if artist == nil
            artist = Artist.new(name)
        end
        artist
    end



    def print_songs
        for i in self.songs
            puts i.name
        end
    end
end


testing = Artist.new("Test")
test2 = Artist.new("David Byrne")

#binding.pry