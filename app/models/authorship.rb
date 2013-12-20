# Authorship ties Zines to Authors
class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :zine_id
  belongs_to(:author,
             validate: true,
             dependent: :destroy)
  validates :author_id, presence: true

  belongs_to :zine, validate: true
  validates :zine_id, presence: true

  after_create :incriment_author_cache_counter
  after_destroy :decriment_author_cache_counter

  private

  def incriment_author_cache_counter
    update_zine_counter(1)
  end

  def decriment_author_cache_counter
    update_zine_counter(-1)
  end

  def update_zine_counter(dir)
    zine.update_attributes author_count: zine.author_count + (1 * dir)
  end
end
