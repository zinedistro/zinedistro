# Author
class Author < ActiveRecord::Base
  has_many :authorships, -> { includes :authors }
  has_many :zines, through: :authorships

  scope :published, -> {
    joins(:zines)
      .merge(Zine.published)
      .except(:order)
      .distinct('authors.id')
      .order('name DESC')
  }

  def self.find_published(id)
    published
      .where(id: id.to_i)
      .first || raise(ActiveRecord::RecordNotFound)
  end

  scope :with_authors, -> { includes(:authors) }
end
