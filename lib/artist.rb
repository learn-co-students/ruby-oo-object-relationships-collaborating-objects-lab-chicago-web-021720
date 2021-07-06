require_relative 'song.rb'
require 'pry'

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

    def songs
        Song.all.select do |song|
            song.artist == self
        end 
    end 

    def add_song(song)
        song.artist = self
    end 

    def self.find_or_create_by_name(name)
        desired_artist = @@all.find { |n| n.name == name }

        if desired_artist.nil?
            Artist.new(name)
        else 
            desired_artist
        end        
    end 

    def print_songs
        select_songs = Song.all.select do |song|
            song.artist == self
        end 
        a = select_songs.map do |song|
            puts song.name
        end 
    end 


end 


