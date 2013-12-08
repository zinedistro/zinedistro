# Authorship ties Zines to Authors
class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :zine_id
  belongs_to(:author,
             validate: true,
             dependent: :destroy)
  validates :author_id, presence: true

  belongs_to :zine, validate: true
  validates :zine_id, presence: true
end
