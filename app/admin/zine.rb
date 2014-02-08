ActiveAdmin.register Zine do
  config.filters = false
  index download_links: false do
    column :id, sortable: :id do |zine|
      link_to "#{zine.id}", admin_zine_path(zine)
    end
    column :title
    column :subtitle
    column :created_at
    column :updated_at
    column :published
  end
end
