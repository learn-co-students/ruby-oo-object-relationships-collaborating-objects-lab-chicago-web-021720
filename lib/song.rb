require_relative ("artist.rb")

require 'pry'
class Song
    attr_reader :artist_name
    attr_accessor :name, :artist
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        song.artist = Artist.new(filename.split(" - ")[0])
        song
        #binding.pry
        #filename comes up like this: 
        #"Michael Jackson - Black or White - pop.mp3"
        #If I split the string at the -, I can isolate the title
        #in the middle of the produced array of 3.
        #it should be at index 1.
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


    def self.all
        @@all
        
    end
end