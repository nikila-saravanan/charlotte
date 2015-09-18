class ArtistsController < ApplicationController
  def show
    # binding.pry
    @artist = RSpotify::Artist.search(params[:q])
  end
end
