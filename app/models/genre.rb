require 'pry'
class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.all.length
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.uniq {|el| el.artist}.length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    songs.map {|el| el.artist.name}.uniq
  end
end
