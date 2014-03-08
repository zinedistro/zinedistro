require 'spec_helper'

require 'carrierwave/test/matchers'
feature 'As a user' do
  before do
    sign_in
  end

  def success_message_for(resource)
    I18n.t('flash.actions.create.notice', resource_name: resource.to_s.humanize)
  end

  scenario 'I can add a new zine' do

    visit new_admin_zine_path
    fill_in 'zine_title', with: "A zine"
    attach_file('zine_cover_image', File.join(Rails.root, '/spec/fixtures/images/transparent.png'))
    page.should have_css '#zine_cover_image_cache'
    click_button 'Create Zine'
    page.should have_content success_message_for :zine
  end
end
