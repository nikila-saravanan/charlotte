class Search < ActiveRecord::Base

  def self.for(artist)
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    RSpotify::Artist.search(artist)
  end
end
