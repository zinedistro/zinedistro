# AuthorsController
class AuthorsController < ApplicationController
  def index
    @authors = Author.published.order_by_name
  end

  def show
    @author = Author.find_published(params[:id])
  end
end
