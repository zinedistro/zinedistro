require "rails_helper"

require 'carrierwave/test/matchers'
feature 'As a user' do
  before do
    sign_in
  end

  scenario 'I can add a new user' do

    visit new_admin_user_path
    fill_in 'user_email', with: "user@zinedistro.org"
    fill_in 'user_password', with: "a password"
    fill_in 'user_password_confirmation', with: "a password"
    click_button 'Create User'
    expect(page).to have_content create_message_for :user
  end
end
