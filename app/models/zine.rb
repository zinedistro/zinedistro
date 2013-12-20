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

  def add_author(author)
    authors << author
  end

  def remove_author(author)
    if author.respond_to? :id
      authors = [author]
    elsif author.respond_to? :each
      authors = author
    else
      fail 'Author expected'
    end
    Authorship.where(author_id: authors.map(&:id), zine: self).destroy_all
  end

  def self.catalog
    published.with_authors
  end

  def self.find_published(id)
    published.where(id: id).limit(1).first
  end
end
