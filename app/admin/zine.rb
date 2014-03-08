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
  form do |f|
    f.inputs "Zine" do
      f.input :title
      f.input :subtitle
    end
    f.inputs "Content" do
      f.input :full_text
      f.input :excerpt
    end
    f.inputs "Attachments" do
      f.input :cover_image
      f.input :cover_image_cache, as: :hidden
    end
    f.actions
  end
end
