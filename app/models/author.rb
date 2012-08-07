class Author < ActiveRecord::Base
  attr_accessible :name
  has_many :authorships
  has_many :zines, :through => :authorships

  def self.published
    Zine.catalog.map(&:authors).flatten.uniq
  end
end
