I18n.enforce_available_locales = true
if Rails.env.development? || Rails.env.test?
  I18n.exception_handler = lambda do |exception, locale, key, options|
    raise "missing translation: #{key}"
  end
end
