class WebController < ApplicationController
  def index
  end

  def data
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artist = Search.for(sanitized_search)[0]
    children_artists = @artist.related_artists
    grandchildren_artists = children_artists.map do |artist|
                                artist.related_artists.delete_if {|artist| artist.name == @artist.name}
                              end
  end

  # def show
  #   # replace non-ASCII characters with ASCII and non-word characters with spaces for API call
  #   sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
  #   @artist = Search.for(sanitized_search).first
  #   @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
  # end

end
