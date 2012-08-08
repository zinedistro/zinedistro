class Zine < ActiveRecord::Base
  attr_accessible :title, :authors, :excerpt, :full_text, :published, :cover_url, :download_url
  has_many :authorships
  has_many :authors, :through => :authorships

  scope :published, where(:published => true)

  def self.catalog
    published.order("updated_at DESC")
  end

  def self.find_published(id)
    published.where(:id => id).first
  end
end
