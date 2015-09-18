require 'rspotify'

class Search < ActiveRecord::Base

  def self.for(artist)
    @artist = RSpotify::Artist.search("#{artist}")
  end

end
