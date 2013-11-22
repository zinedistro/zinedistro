class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :zine_id
  belongs_to :author
  belongs_to :zine
  # after_destroy :notify_zine_of_author_deletion
  #
  # def notify_zine_of_author_deletion
  #   todo
  #   zine.destroy_if_no_authors
  # end
end
