module ApplicationHelper
  # def blog_path
  #   "http://blog.zinedistro.org"
  # end

  # def twitter_path
  #   "http://twitter.com/zinedistro"
  # end

  # def tra_path
  #   "http://theresistancearmy.com"
  # end

  # def faunzy_path
  #   "http://twitter.com/faunzy"
  # end

  # def page_id
  #   "#{controller.controller_name}_#{controller.action_name}"
  # end

  # def page_classes
  #   "#{controller.controller_name} #{controller.action_name}"
  # end

  # def body_attributes
  #   "id='#{page_id}' class='#{page_classes}'"
  # end

  def edit_action?
    controller.action_name =~ /edit/
  end

  # def new_action?
  #   controller.action_name =~ /new/
  # end

  def link_to_previous_and_next_zines(zine)
    links = content_tag(:li, (link_to "&#x2190; Previous".html_safe, navigate_zines_path(@zine, :previous), :rel => "prev", :class => "prev_page")) +
            content_tag(:li, (link_to "Next &#x2192;".html_safe,     navigate_zines_path(@zine, :next)    , :rel => "next", :class => "next_page"))

    content_tag(:ul, links, :class => "previous_next")
  end

  def previous_next_links
    if @zine.try(:id)
      html = []
        html << content_tag(:link, nil, :rel => "next", :href => navigate_zines_path(@zine, :next))
        html << content_tag(:link, nil, :rel => "prev", :href => navigate_zines_path(@zine, :previous))
      html.join("\n")
    end
  end

  def link_to_cover_image_tag(zine)
    link_to cover_image_tag(zine), sanitized_seo_zine_path(zine), :class => "cover"
  end

  def link_to_title_tag(zine)
    link_to zine.title, sanitized_seo_zine_path(zine), :rel => "bookmark"
  end

  # def link_to_subtitle_tag(zine)
  #   link_to zine.subtitle, sanitized_seo_zine_path(zine)
  # end

  def download_path(zine)
    "http://assets.zinedistro.org/zines/pdfs/#{zine.id}.pdf"
  end

  def cover_image_tag(zine)
    image_tag("http://assets.zinedistro.org/zines/covers/#{zine.id}.png")
  end

  def author_name(zine)
    content_tag(:span, (zine.authors.none? ? "Anonymous" : zine.authors.map(&:name).to_sentence), :class => "author")
  end

  # def canonical_urls
  #   short_url =  request.protocol
  #   short_url << request.host
  #   short_url << ":#{request.port}" unless request.port.blank?

  #   if @short_path
  #     short_url << @short_path
  #   elsif controller.controller_name =~ /zines/ && params[:id]
  #     short_url << "/z/#{params[:id]}"
  #   elsif controller.controller_name =~ /zines/
  #     short_url << "/zz"
  #   end

  #   unless short_url == request.url.gsub(/\/$/, "")
  #     [
  #       content_tag(:link, nil, :rel => "canonical", :href => request.url),
  #       content_tag(:link, nil, :rev => "canonical", :href => short_url, :type => "text/html")
  #     ].join("\n")
  #   end
  # end

  def previous_next_zine(zine, direction)
    on_deck_zine_id = (direction.to_s == "next" ? zine.id + 1 : zine.id - 1)

    if on_deck_zine_id.zero?
      Zine.last
    elsif on_deck_zine_id > Zine.all.length
      Zine.first
    else
      Zine.find(on_deck_zine_id)
    end
  end

  def navigate_zines_path(zine, direction)
    on_deck_zine = previous_next_zine(zine, direction)
    edit_action? ? edit_zine_path(on_deck_zine) : sanitized_seo_zine_path(on_deck_zine)
  end

  # def google_analytics(google_analytics_key)
  #   if RAILS_ENV == "production"
  #     javascript_tag("var gaJsHost = (('https:' == document.location.protocol) ? 'https://ssl.' : 'http://www.');
  #                     document.write(unescape(\"%3Cscript src='\" + gaJsHost + \"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E\"));") +

  #     javascript_tag("try {
  #                       var pageTracker = _gat._getTracker('#{google_analytics_key}');
  #                       pageTracker._trackPageview();
  #                     } catch(err) {}")
  #   end
  # end

  # def development_links
  #   if RAILS_ENV == "development"
  #     new_zine_link + new_author_link
  #   end
  # end

  # def new_author_link
  #   link_to "New Author", new_author_path, :accesskey => "a"
  # end

  # def new_zine_link
  #   link_to "New Zine", new_zine_path, :accesskey => "n"
  # end

  # def sanitize_for_url(thing)
  #   thing.downcase.gsub(/&/, "and").gsub(/ /, "-").gsub(/,|\.|'|\/|\\|!|:|\?|#/, "").gsub(/--/, "-")
  # end

end
