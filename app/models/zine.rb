# Zine
class Zine < ActiveRecord::Base
  has_many :authorships
  has_many :authors,
           through: :authorships,
           after_add: [:incriment_author_cache_counter],
           after_remove: [:decriment_author_cache_counter]
  mount_uploader :cover_image, CoverImageUploader

  validates_presence_of :cover_image

  scope :published, lambda {
    where(published: true)
    .order(updated_at: :desc)
  }
  scope :with_authors, -> { includes(:authors) }

  def publish!
    update_attributes!(published: true)
  end

  def add_author(author_to_add)
    authors << author_to_add
  end

  def remove_author(author_to_remove)
    authors.delete(author_to_remove)
  end

  def self.catalog
    published
  end

  def self.catalog_with_authors
    with_authors.published
  end

  def self.find_published(id)
    published.find_by!(id: id.to_i)
  end

  def self.find_published_with_authors(id)
    with_authors.find_published(id)
  end

  private

  def incriment_author_cache_counter(record)
    update_zine_counter(1)
  end

  def decriment_author_cache_counter(record)
    update_zine_counter(-1)
  end

  def update_zine_counter(dir)
    update_attributes! author_count: author_count + (1 * dir)
  end
end
