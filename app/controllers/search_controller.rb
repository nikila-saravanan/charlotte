class SearchController < ApplicationController
  def index

  end

  def show
    # binding.pry
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W|\d)/, " ")
    @artist = Search.for(sanitized_search).first
    @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
  end
end
