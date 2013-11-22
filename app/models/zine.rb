class Zine < ActiveRecord::Base
  attr_accessible :title, :excerpt, :full_text, :published, :cover_url, :download_url
  has_many :authorships
  has_many :authors, :through => :authorships

  # def destroy_if_no_authors
  #   todo
  # end

  scope :published, -> { where(published: true).order(updated_at: :desc) }

  def self.catalog
    published.limit(10)
  end

  def self.find_published(id)
    published.where(:id => id).first
  end

  def author_names
    if authors.any?
      authors.map(&:name).to_sentence
    else
      "Anonymous"
    end
  end
end
