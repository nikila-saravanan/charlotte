class WebController < ApplicationController
  def index
  end

  def data
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artists = Search.json_for(sanitized_search)
    @related_artists = Search.json_for_related(sanitized_search)
  end

  def show
    # replace non-ASCII characters with ASCII and non-word characters with spaces for API call
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artist = Search.for(sanitized_search).first
    @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
  end

end
