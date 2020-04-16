class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    if song.artist == nil
      song.artist = self
    end
    end
  end


  def genres
    genres = []
    @songs.each {|song| genres << song.genre}
    genres.uniq
  end

end
