# ZinesController
class ZinesController < ApplicationController
  decorates_assigned :zines
  decorates_assigned :zine

  def index
    @zines = Zine.catalog_with_authors.decorate
  end

  def show
    @zine = Zine.find_published_with_authors(ZineParams.build(params)).decorate
    not_found unless @zine
  end

  # strong parameters for zine
  class ZineParams
    def self.build(params)
      params.require(:id)
    end
  end
end
