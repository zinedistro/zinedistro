require 'rails_helper'
feature 'Creating Authors' do
  let(:user) { create :user }
  let(:author) { attributes_for :author }

  before do
    sign_in user
  end

  scenario 'Visiting the author page' do
    visit new_admin_author_path
    expect(page).to have_link t('authors.pluralized_title')
    fill_in 'author_name', with: author
    click_button 'Create Author'
    expect(page).to have_content create_message_for :author
  end
end
