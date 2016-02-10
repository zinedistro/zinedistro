# AuthorsController
class AuthorsController < ApplicationController
  def index
    @authors = Author.published.order_by_name
    fresh_when last_modified: @authors.maximum(:updated_at), public: true
  end

  def show
    @author = Author.find_published(params[:id])
    fresh_when last_modified: @author.updated_at, public: true
  end
end
