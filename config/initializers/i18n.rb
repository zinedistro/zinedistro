I18n.enforce_available_locales = true
if Object.const_defined?(:ZineDistro) && ZineDistro.const_defined?(:Application)
  if Rails.env.development? || Rails.env.test?
    I18n.exception_handler = lambda do |_exception, locale, key, _options|
      fail "missing translation: #{key} for #{locale}"
    end
  end
end
