require_relative "./lib/artist.rb"
require_relative "./lib/mp3_importer.rb"
require_relative "./lib/song.rb"

ho = MP3Importer.new('./spec/fixtures/mp3s')
p ho.files