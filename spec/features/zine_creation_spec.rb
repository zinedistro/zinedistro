require "rails_helper"

require 'carrierwave/test/matchers'
feature 'As a user' do
  before do
    sign_in
  end

  scenario 'I can add a new zine' do

    visit new_admin_zine_path
    fill_in 'zine_title', with: "A zine"
    attach_file('zine_cover_image', File.join(Rails.root, '/spec/fixtures/images/transparent.png'))
    attach_file('zine_pdf', File.join(Rails.root, '/spec/fixtures/pdfs/transparent.pdf'))
    within "#zine_pdf_input" do
      expect(page).to have_content "PDF"
    end
    expect(page).to have_css 'input#zine_cover_image_cache', visible: false
    expect(page).to have_css 'input#zine_pdf_cache', visible: false
    click_button 'Create Zine'
    expect(page).to have_content create_message_for :zine
  end
end
