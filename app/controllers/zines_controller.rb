# ZinesController
class ZinesController < ApplicationController
  def index
    respond_to do |format|
      @zines = Zine.catalog_with_authors.page(ZineParams.index(params)[:page]).decorate
      @most_recent = Zine.most_recently_published_date
      fresh_when(
        last_modified: @most_recent,
        public: true,
        etag: @most_recent
      )
      format.html
    end
  end

  def show
    respond_to do |format|
      @zine = Zine.find_published_with_authors(ZineParams.show(params)).decorate
      not_found unless @zine
      fresh_when(
        last_modified: @zine.updated_at,
        public: true,
        etag: @zine.cache_key
      )
      format.html
    end
  end

  # strong parameters for zine
  class ZineParams
    def self.show(params)
      params.require(:id)
    end

    def self.index(params)
      params.permit(:page, :format) if params
    end
  end
end
