require 'carrierwave/orm/activerecord'
require_dependency 'cover_image_uploader'
require_dependency 'pdf_uploader'

# Zines are why you're here
class Zine < ActiveRecord::Base
  has_many :authorships
  has_many(
    :authors,
    -> { distinct.order(:name) },
    through: :authorships,
    after_add: [:increment_author_cache_counter],
    after_remove: [:decrement_author_cache_counter]
  )

  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :pdf, PdfUploader

  validates_presence_of :title, :cover_image, :pdf

  before_validation(:generate_assets_from_legacy_ids)

  scope :published, lambda {
    where(published: true)
  }

  scope :order_by_updated, lambda {
    order(updated_at: :desc)
  }

  scope :most_recent, lambda {
    published
      .order_by_updated
      .take(1)
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
    with_authors.published.order_by_updated
  end

  def self.find_published(id)
    published.find_by!(id: id.to_i)
  end

  def self.find_published_with_authors(id)
    with_authors.find_published(id)
  end

  def self.most_recently_published_date
    most_recent.first.try(:updated_at)
  end

  private

  def generate_assets_from_legacy_ids
    return unless legacy_id.present?
    generate_cover_image_from_legacy_id
    generate_pdf_from_legacy_id
  end

  def generate_cover_image_from_legacy_id
    self.remote_cover_image_url =
      "http://assets.zinedistro.org/zines/covers/#{legacy_id}.png"
  end

  def generate_pdf_from_legacy_id
    self.remote_pdf_url =
      "http://assets.zinedistro.org/zines/pdfs/#{legacy_id}.pdf"
  end

  def increment_author_cache_counter(*)
    update_zine_counter(1)
  end

  def decrement_author_cache_counter(*)
    update_zine_counter(-1)
  end

  def update_zine_counter(dir)
    update_attribute(:author_count, author_count + (1 * dir))
  end
end
