# Zine
class Zine < ActiveRecord::Base
  attr_accessible :title,
                  :excerpt,
                  :subtitle,
                  :full_text,
                  :published,
                  :cover_url,
                  :download_url,
                  :author_count

  has_many :authorships
  has_many :authors, through: :authorships

  scope :published, -> { where(published: true).order(updated_at: :desc) }
  scope :with_authors, -> { includes(:authors) }

  def add_author(author_to_add)
    authors << author_to_add
  end

  def remove_author(author_to_remove)
    authors.delete(author_to_remove)
  end

  def self.catalog
    published.with_authors
  end

  def self.find_published(id)
    published.where(id: id).limit(1).first
  end
end
