def success_message_for(resource)
  I18n.t('flash.actions.create.notice', resource_name: resource.to_s.humanize)
end
