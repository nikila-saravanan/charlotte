class ArtistsController < ApplicationController
  def show
  end

  def new
    artist = Artist.find_by(name: params["artist_name"])
    # @artist = Artist.find_or_create_by(name: params["artist_name"],url: params["artist_url"],followers: params["artist_followers"])
    new_artist = Artist.create(name: params["artist_name"],url: params["artist_url"],followers: params["artist_followers"]) unless artist
    if current_user.artists.find_by(name: params["artist_name"])
      flash[:alert] = "#{artist.name} is already in your favorites."
    else
      current_user.artists << new_artist
      flash[:success] =  "#{new_artist.name} has been added to your favorites."
    end
      redirect_to user_path(current_user.id)
  end

  def destroy
  end

end
