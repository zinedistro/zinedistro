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
  has_many :authors,
           through: :authorships,
           after_add: [:incriment_author_cache_counter],
           after_remove: [:decriment_author_cache_counter]

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
