class WebController < ApplicationController

  def index
  end

  def data
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artist = Search.for(sanitized_search)[0]

    children_artists = @artist.related_artists

    grandchildren_artists = children_artists.map do |child_artist|
      child_artist.related_artists.delete_if do |grandchild_artist|
        grandchild_artist.name == @artist.name || children_artists.any? {|a| a.name == grandchild_artist.name}
      end
    end
  end
end
