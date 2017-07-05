require "rails_helper"

require 'carrierwave/test/matchers'
feature 'As an admin user' do
  before do
    sign_in
  end

  scenario 'I can view the existing admin users' do
    visit admin_admin_users_path
    expect(page).to have_content AdminUser.first.email
  end
end
