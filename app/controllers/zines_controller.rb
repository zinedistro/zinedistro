class ZinesController < ApplicationController
  def index
    @zines = Zine.catalog
  end

  def show
    @zine = Zine.find_published(params[:id])
    not_found unless @zine
  end
end
