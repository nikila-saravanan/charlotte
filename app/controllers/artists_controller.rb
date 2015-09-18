class ArtistsController < ApplicationController
  def show
    @artist = RSpotify::Artist.search(params[:q])[0]
    # binding.pry
  end
end
