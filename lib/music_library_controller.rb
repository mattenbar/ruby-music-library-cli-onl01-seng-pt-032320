require "pry"
class MusicLibraryController

def initialize(path = './db/mp3s')
  @path = path
  MusicImporter.new(path).import
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

    input = gets

    if input != "exit"
      call
    end
  end

  def list_songs
    song_list = Song.all.sort{|a, b| a.name <=> b.name}
    song_list.each_with_index do |s, index|
      puts "#{index+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.sort{|a, b| a.name <=> b.name}
    artist_list.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort{|a, b| a.name <=> b.name}
    genre_list.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"


  end





end
