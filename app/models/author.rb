require_dependency 'zine'
require_dependency 'authorship'
# Author
class Author < ActiveRecord::Base
  has_many :authorships, -> { includes :authors }
  has_many :zines, through: :authorships

  scope :published, -> {
    joins(:zines)
      .merge(Zine.published)
      .distinct('authors.id')
  }

  scope :order_by_name, -> {
    order('name asc')
  }

  def self.find_published(id)
    published
      .where(id: id.to_i)
      .first || raise(ActiveRecord::RecordNotFound)
  end

  scope :with_authors, -> { includes(:authors) }
end
