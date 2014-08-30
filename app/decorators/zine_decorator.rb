# ZineDecorator adds helpers for zines
class ZineDecorator < ModelDecorator
  def path
    zine_seo_path object,
                  sanitize_for_url(object.title),
                  sanitize_for_url(author_names)
  end

  def author_name_tag
    h.content_tag(:span,
                  (author_names),
                  class: 'author')
  end

  def cover_image_tag
    h.content_tag(:figure,
                  style: "background-image: url(#{cover_image_url})",
                  class: "zine-image") do
      h.content_tag :figcaption do
        object.title
      end
    end
  end

  def download_link
    h.link_to((I18n.t :download_link).upcase,
              "http://assets.zinedistro.org/zines/pdfs/#{object.id}.pdf")
  end

  def author_names
    if object.authors.any?
      object.authors.map(&:name).to_sentence
    else
      I18n.t(:anonymous)
    end
  end

  private

  def cover_image_url
    object.cover_image.list_view.url
  end

  def sanitize_for_url(thing)
    thing.downcase
      .gsub(/&/, 'and')
      .gsub(/ /, '-')
      .gsub(/,|\.|'|\/|\\|!|:|\?|#/, '')
      .gsub(/--/, '-')
  end
end
