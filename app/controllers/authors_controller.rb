# AuthorsController
class AuthorsController < ApplicationController
  def index
    @authors = Author.published
  end

  def zines
    @author = Author.find(params[:id])
    @zines = @author.zines
  end
end
