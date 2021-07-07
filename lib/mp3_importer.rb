require 'pry'

class MP3Importer

    attr_reader :path, :files

    # Doesn't seem like path should be an instance attribute.
    # Rather, could have one MP3Importer instance, and pass different `path`s to `#import`
    def initialize(path)
        @path = path
        @files = get_file_names
    end

    def get_file_names
        filenames_with_path = Dir[path + '/*.mp3']
        filenames_with_path.map {|file_name_with_path| file_name_with_path.split('/')[-1]}
    end

    def import
        files.each {|file_name| Song.new_by_filename(file_name)}
    end

end

