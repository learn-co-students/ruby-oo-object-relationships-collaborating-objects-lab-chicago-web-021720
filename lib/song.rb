require 'pry'
class Song
    attr_accessor :name, :artist
    attr_reader :artist_name
    

    @@all = []

    #INPUTS: song name as string
    #OUTPUTS
    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #IMPORTANT NOTE: Remember that when you updated the artist by doing something like 
    #song_name.artist = artist, this is updating the instance WHICH will be updated in the 
    #@@all array

    #intputs: file name without path
    #outputs: splits that filename into an array based on regex
    #and creates a new song instance using the songs name, then
    #creates a new artist instance using the songs name and assigns
    #that new artist instance to the new songs artist method. Returns new song
    def self.new_by_filename(file)
        song = file.split(/\s\-\s/)
        new_song = Song.new(song[1])
        new_song.artist = Artist.new(song[0])
        new_song
    end

    #inputs: artist name 
    #outputs: checks Artist.all for artist instance where artist.name == provided
    #artist's name creating an array for matching artist instances. 
    #Then creates a new artist instance if the array is empty (due to no existing
    #artist instance) and assigns the new artist instance to self.artist. If 
    #artist.all did have a matching artist instance, assigns that artist instance
    #to self.artist
    def artist_name=(name)
        test_artist = Artist.all.select {|artist| artist.name == name}
        
        if test_artist == []
            new_artist = Artist.new(name)
            self.artist = new_artist
        else
            self.artist = test_artist[0]
        end
    end
    
end
