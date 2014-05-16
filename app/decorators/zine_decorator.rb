# ZineDecorator adds helpers for zines
class ZineDecorator < ModelDecorator
  def link_to_cover_image_tag
    h.link_to(cover_image_tag, zine_path(object))
  end

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
    h.image_tag(cover_image, alt: object.title)
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

  def cover_image
    #TODO: Remove this method. Delegate to methods on mounted cover image
    "http://assets.zinedistro.org/zines/covers/#{object.id}.png"
  end

  def default_zine_image
    'http://assets.zinedistro.org/zines/covers/missing.png'
  end

  def sanitize_for_url(thing)
    thing.downcase
      .gsub(/&/, 'and')
      .gsub(/ /, '-')
      .gsub(/,|\.|'|\/|\\|!|:|\?|#/, '')
      .gsub(/--/, '-')
  end
end
