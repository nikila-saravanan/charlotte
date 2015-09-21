class Search < ActiveRecord::Base

  def self.for(artist)
    RSpotify::Artist.search("#{artist}")
  end

  def self.json_for(artist)
    RSpotify.raw_response = true
    RSpotify::Artist.search("#{artist}")
  end

  def self.json_for_related(artist)
    RSpotify.raw_response = false
    RSpotify::Artist.search("#{artist}")[0].related_artists.to_json.html_safe
  end

end
