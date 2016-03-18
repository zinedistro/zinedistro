# AuthorsController
class AuthorsController < ApplicationController
  def index
    @authors = Author.published.order_by_name
    @most_recent = Author.most_recently_updated_at
    fresh_when(
      last_modified: @most_recent,
      public: true,
      etag: @most_recent
    )
  end

  def show
    @author = Author.find_published(params[:id])
    fresh_when(
      last_modified: @author.updated_at,
      public: true,
      etag: @author.cache_key
    )
  end
end
