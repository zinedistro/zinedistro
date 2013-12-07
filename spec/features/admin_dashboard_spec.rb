require 'spec_helper'
feature 'As a user I can see an admin dashboard' do
  before do
    sign_in
  end

  scenario 'As a user I can log in to the dashboard' do
    visit admin_dashboard_path
    page.should have_content 'Dashboard'
  end
end
