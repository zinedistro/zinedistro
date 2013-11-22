module Url
  def santized_seo_zine_path(zine)
    zine_seo_path(zine, sanitize_for_url(zine.title), sanitize_for_url(zine.author.name))
  end

  def sanitize_for_url(thing)
    thing.downcase.gsub(/&/, "and").gsub(/ /, "-").gsub(/,|\.|'|\/|\\|!|:|\?|#/, "").gsub(/--/, "-")
  end
end
