# Authorship ties Zines to Authors
class Authorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :zine
  # after_destroy :notify_zine_of_author_deletion
  #
  # def notify_zine_of_author_deletion
  #   todo
  #   zine.destroy_if_no_authors
  # end
end
