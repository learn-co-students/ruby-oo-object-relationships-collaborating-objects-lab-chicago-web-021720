require 'pry'
class MP3Importer
    attr_accessor :path, :files

    def initialize(filepath)
        @path = filepath
    end

    def files
        array_of_files = Dir.entries(self.path)
        cleaned_array = []
        for i in array_of_files 
            if i.include? ".mp3"
                cleaned_array.push i 
            end
        end
        cleaned_array
    end

    def import
        for i in files
            Song.new_by_filename(i)
        end
    end
end
