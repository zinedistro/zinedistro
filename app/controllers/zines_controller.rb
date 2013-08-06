class ZinesController < ApplicationController
  def index
    @zines = Zine.catalog
  end

  def show
    @zine = Zine.find_published(ZineParams.build(params))
    not_found unless @zine
  end

  class ZineParams
    def self.build params
      params.require(:id)
    end
  end

end

