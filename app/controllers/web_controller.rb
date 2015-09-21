class WebController < ApplicationController
  def index
  end

  def data
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artists = Search.json_for(sanitized_search)
    @related_artists = Search.json_for_related(sanitized_search)
  end

end
