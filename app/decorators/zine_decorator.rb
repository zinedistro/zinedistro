# ZineDecorator adds helpers for zines
class ZineDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def link_to_cover_image_tag
    if object.cover_url.present?
      helpers.image_tag object.cover_url
    else
      helpers.image_tag default_zine_image, alt: 'Missing zine cover'
    end
  end

  def sanitized_seo_zine_path
    zine_seo_path object,
                  sanitize_for_url(object.title),
                  sanitize_for_url(object.author_names)
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
