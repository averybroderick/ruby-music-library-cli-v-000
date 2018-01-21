class MusicLibraryController

  attr_accessor :path, :library

  def initialize(path="./db/mp3s")
    @path = path
    @library = MusicImporter.new(self.path)
    self.library.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    answer = gets.strip until answer == 'exit'
  end

  def list_songs
    counter = 1
    sorted = self.library.files.sort
    sorted.each do |file|
      puts "#{counter}. #{file[0...-4]}"
      counter += 1
    end
  end

end
