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
  has_many :authors, through: :authorships

  scope :published, -> { where(published: true).order(updated_at: :desc) }

  def self.catalog
    published
  end

  def self.find_published(id)
    published.where(id: id).limit(1).first
  end
end
