%w{ create update destroy }.each do |action|
  define_method "#{action}_message_for" do |resource|
    I18n.t("flash.actions.#{action}.notice",
           resource_name: resource.to_s.humanize)
  end
end
