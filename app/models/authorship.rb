# Authorship ties Zines to Authors
class Authorship < ActiveRecord::Base
  belongs_to(:author,
             validate: true,
             dependent: :destroy)
  validates :author_id, presence: true

  belongs_to :zine, validate: true
  validates :zine_id, presence: true
end
