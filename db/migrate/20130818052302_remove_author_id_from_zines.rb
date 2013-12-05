class RemoveAuthorIdFromZines < ActiveRecord::Migration
  def up
    Zine.all.find_each do |zine|
      author = Author.find_by_id(zine.author_id)
      if author
        say "Adding #{author.name} to #{zine.title}"
        zine.authors << author
      end
    end
    remove_column :zines, :author_id, :integer
  end

  def down
    add_column :zines, :author_id, :integer
    Zine.all.find_each do |zine|
      if zine.authors.length > 1
        fail "More than one author for #{zine.name} (#{zine.id})"
      elsif zine.authors.length == 1
        zine.author_id = zine.authors.first.id
      end
    end
  end
end
