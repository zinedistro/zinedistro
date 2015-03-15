atom_feed do |feed|
  feed.title "#{I18n.t('site.name')}: #{I18n.t('site.tagline')}"
  feed.updated @most_recent
  feed.author do |author|
    author.name I18n.t('site.name')
  end

  @zines.each do |zine|
    feed.entry(zine) do |entry|
      entry.title zine.full_title
      entry.content simple_format(zine.excerpt), type: 'html'
      entry.author do |author|
        author.name zine.author_names
      end
    end
  end
end
