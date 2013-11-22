# ZineDecorator adds helpers for zines
class ZineDecorator < Draper::Decorator
  delegate_all

  def link_to_cover_image_tag
    if object.cover_url.present?
      helpers.image_tag object.cover_url
    else
      helpers.image_tag default_zine_image, alt: 'Missing zine cover'
    end
  end

  def default_zine_image
    'http://assets.zinedistro.org/zines/covers/missing.png'
  end
end
