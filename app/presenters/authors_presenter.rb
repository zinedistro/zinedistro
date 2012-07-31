class AuthorsPresenter
  def initialize collection
    @collection = collection
  end

  def names
    @collection.map(&:name).join(", ")
  end
end
