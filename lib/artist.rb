require 'pry'
class Artist
    attr_accessor :name

    @@all = []
    
    #INPUT: Artist name as string
    #OUTPUT: Assigns .name to artist name, adds current instance to @@all array
    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #OUTPUTS: all songs that belong to artist instance 
    #INOTES: demonstrates one to many relationships
    def songs
        Song.all.select {|song| song.artist == self}
    end

    #Please note that the input here is a song instance
    #Adds this artist instance to the song instance
    def add_song(song)
        song.artist = self
    end

    #inputs: artist name 
    #outputs: tests to see if artist instance exists 
    #and then either creates one if it doesn't or returns the one that does
    def self.find_or_create_by_name(name)
        test_name = self.all.select {|artist| artist.name == name}
        
        
        if test_name == []
            name = self.new(name)
            return name
        else
            test_name = test_name[0]
            return test_name
        end
    end

    #inputs: called on artist instance
    #outputs: assigns array of song instances to variable and iterates through
    #each instance and prints the song.name and creates a new line
    def print_songs
        songs = Song.all.select {|song| song.artist == self}
        songs.each {|song| puts "#{song.name}\n"}
    end
end