class WebController < ApplicationController
  # protect_from_forgery except: :data

  def index
    if params[:q]
      search_param = CGI::escapeHTML(params[:q])
      redirect_to ("/web/data?utf8=%E2%9C%93&q=#{search_param}&commit=Search")
      return
    end
  end

  def show
  end

  def data
    sanitized_search = I18n.transliterate(params[:q]).gsub(/(\W)/, " ")
    @artist = Search.for(sanitized_search)[0]

    if !@artist
      begin
        raise SearchError
      rescue
        flash.now[:error] = "Sorry, we couldn't find that artist. Please try again."
      end
    else
      @related_artists = @artist.related_artists.sort_by {|artist| artist.followers["total"]}.reverse
      children_artists = @artist.related_artists

      grandchildren_artists = children_artists.map do |child_artist|
        child_artist.related_artists.delete_if do |grandchild_artist|
          grandchild_artist.name == @artist.name || children_artists.any? {|a| a.name == grandchild_artist.name}
        end
      end
    end
    # binding.pry
  end
end
