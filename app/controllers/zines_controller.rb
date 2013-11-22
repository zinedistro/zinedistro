class ZinesController < ApplicationController
  decorates_assigned :zines
  decorates_assigned :zine

  def index
    @zines = Zine.catalog
    ZineDecorator.decorate_collection(@zines)
  end

  def show
    @zine = Zine.find_published(ZineParams.build(params)).decorate
    not_found unless @zine
    ZineDecorator.decorate(@zine)
  end

  class ZineParams
    def self.build params
      params.require(:id)
    end
  end

end

