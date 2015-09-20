class WebController < ApplicationController
  def index
  end

  def data
    respond_to do |format|
      format.json {render file: 'web/data'}
    end
  end
end
