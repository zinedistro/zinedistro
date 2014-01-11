# ZineDecorator adds helpers for zines
class ZineDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def link_to_cover_image_tag
    if object.cover_url.present?
      helpers.image_tag object.cover_url
    else
      helpers.image_tag default_zine_image, alt: I18n.t(:missing_zine_cover)
    end
  end

  def path
    zine_seo_path object,
                  sanitize_for_url(object.title),
                  sanitize_for_url(author_names)
  end

  def title_link
    h.link_to object.title, path, rel: 'bookmark'
  end

  def subtitle_link
    h.link_to object.subtitle, path, rel: 'bookmark'
  end

  def author_name_tag
    h.content_tag(:span,
                  (author_names),
                  class: 'author')
  end

  def cover_image_tag
    h.image_tag("http://assets.zinedistro.org/zines/covers/#{object.id}.png",
                alt: object.title)
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
