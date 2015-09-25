class Search < ActiveRecord::Base

  def self.for(artist)
    RSpotify::Artist.search("#{artist}")
  end
end
