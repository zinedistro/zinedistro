require 'spec_helper'

require 'carrierwave/test/matchers'
feature 'As a user' do
  before do
    sign_in
  end

  scenario 'I can add a new user' do

    visit admin_users_path
    expect(page).to have_content User.first.email
  end
end
