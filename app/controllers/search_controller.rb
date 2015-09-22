class SearchController < ApplicationController
  def index

  end

  def show
    # replace non-ASCII characters with ASCII and non-word characters with spaces for API call
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artist = Search.for(sanitized_search).first
    if !@artist
      begin
        raise SearchError
      rescue
        flash.now[:error] = "Sorry, we couldn't find that artist. Please try again."
      end
    else
      @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
    end
  end


end

class SearchError < StandardError

end
