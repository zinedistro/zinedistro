require 'carrierwave/orm/activerecord'
require_dependency 'cover_image_uploader'
require_dependency 'pdf_uploader'

# ZineRepository is a repostory object for interacting with activerecord
# No model logic should go in this class
class Zine < ActiveRecord::Base

  has_many :authorships
  has_many :authors,
           -> { distinct.order(:name) },
           through: :authorships,
           after_add: [:incriment_author_cache_counter],
           after_remove: [:decriment_author_cache_counter]

  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :pdf, PdfUploader

  validates_presence_of :title, :cover_image, :pdf

  scope :published, -> {
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
