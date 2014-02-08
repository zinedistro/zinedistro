# AuthorsController
class AuthorsController < ApplicationController
  def index
    @authors = Author.published
  end

  def show
    @author = Author.find_published(params[:id])
  end
end
