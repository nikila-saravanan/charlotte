class ArtistsController < ApplicationController
  def show
  end

  def new
    @artist = Artist.create(name: params["artist_name"],url: params["artist_url"],followers: params["artist_followers"])
    current_user.artists << @artist
    redirect_to user_path(current_user.id)
  end

end
