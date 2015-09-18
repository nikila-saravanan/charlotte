class SearchController < ApplicationController
  def index

  end

  def show
    @artist = Search.for(params[:q])[0]
    # binding.pry
    @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
  end
end
