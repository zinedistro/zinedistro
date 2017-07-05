require "rails_helper"

require 'carrierwave/test/matchers'
feature 'As a user' do
  before do
    sign_in
  end

  scenario 'I can add a new admin user' do

    visit new_admin_admin_user_path
    expect(page).to have_content AdminUser.first.email
  end
end
