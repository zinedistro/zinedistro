# Author
class Author < ActiveRecord::Base
  has_many :authorships, -> { includes :authors }
  has_many :zines, through: :authorships

  scope :published, lambda {
    joins(:zines).merge(Zine.catalog).uniq
  }

  def self.find_published(id)
    published.find_by!(id: id.to_i)
  end

  scope :with_authors, -> { includes(:authors) }
end
