# Zine
class Zine < ActiveRecord::Base
  attr_accessible :title,
                  :excerpt,
                  :subtitle,
                  :full_text,
                  :published,
                  :cover_url,
                  :download_url
  has_many :authorships
  has_many :authors, through: :authorships, counter_cache: :author_count

  scope :published, -> { where(published: true).order(updated_at: :desc) }
  scope :with_authors, -> { includes(:authors) }

  def self.catalog
    published.with_authors
  end

  def self.find_published(id)
    published.where(id: id).limit(1).first
  end
end
