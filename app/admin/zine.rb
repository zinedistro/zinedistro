ActiveAdmin.register Zine do
  menu label: proc { I18n.t 'zines.pluralized_title' }
  controller do
    def permitted_params
      params.permit(:utf8,
                    :commit,
                    :authenticity_token,
                    zine: [:title,
                           :excerpt,
                           :subtitle,
                           :full_text,
                           :published,
                           :download_url,
                           :author_count,
                           { author_ids: [] },
                           :cover_image,
                           :cover_image_cache,
                           :remote_cover_image_url,
                           :pdf,
                           :pdf_cache,
                           :remote_pdf_url])
    end
  end

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
    f.inputs 'Zine' do
      f.input :title
      f.input :subtitle
    end

    f.inputs 'Authors' do
      f.input(:authors,
              as: :select,
              input_html: {
                style: 'width: 25%;',
                class: 'zine_authors',
                placeholder: 'Enter an author name',
                value: f.object.authors.join(',')
              }
             )
    end
    f.inputs 'Content' do
      f.input :full_text
      f.input :excerpt
    end
    f.inputs 'Attachments' do
      f.input :cover_image
      f.input :cover_image_cache, as: :hidden
      f.input :pdf, label: 'PDF'
      f.input :pdf_cache, as: :hidden
    end
    f.actions
  end
end
