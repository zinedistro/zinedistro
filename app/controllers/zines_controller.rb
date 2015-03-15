# ZinesController
class ZinesController < ApplicationController
  def index
    @zines = Zine.catalog_with_authors.page(ZineParams.index(params)[:page]).decorate
    @most_recent = Zine.most_recently_published_date
  end

  def show
    @zine = Zine.find_published_with_authors(ZineParams.show(params)).decorate
    not_found unless @zine
  end

  # strong parameters for zine
  class ZineParams
    def self.show(params)
      params.require(:id)
    end

    def self.index(params)
      params.permit(:page) if params
    end
  end
end
