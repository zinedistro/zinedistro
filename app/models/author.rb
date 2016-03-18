require_dependency 'zine'
require_dependency 'authorship'
# Author
class Author < ActiveRecord::Base
  has_many :authorships, -> { includes :authors }
  has_many :zines, through: :authorships

  scope :published, -> {
    joins(:zines).
    merge(Zine.published).
    distinct('authors.id')
  }

  scope :order_by_name, -> {
    order('name asc')
  }

  scope :order_by_updated, lambda {
    order(updated_at: :desc)
  }

  scope :most_recently_updated, lambda {
    order_by_updated.limit(1)
  }

  def self.most_recently_updated_at
    most_recently_updated.pluck(:updated_at).first
  end

  def self.find_published(id)
    published.
      where(id: id.to_i).
      first || raise(ActiveRecord::RecordNotFound)
  end

  scope :with_authors, -> { includes(:authors) }
end
