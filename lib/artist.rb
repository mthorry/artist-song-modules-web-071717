require 'pry'

class Artist
  extend Memorable
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def self.find_by_name(name) # finds artist in @@artist array
    @@artists.detect{|a| a.name == name} # that matches name
  end

  def initialize # each new instance of artist is initialized
    @@artists << self # with an empty songs array
    @songs = [] # artist HAS MANY songs!
  end

  def self.all # prints @@artists array
    @@artists
  end

  def add_song(song) # adds song to the artist's @songs array
    @songs << song
    song.artist = self # song BELONGS TO artist
  end

  def add_songs(songs) # adds multiple songs to artist's @songs arr
    songs.each { |song| add_song(song) }
  end

  def to_param # takes name and formats it
    name.downcase.gsub(' ', '-')
  end

end
