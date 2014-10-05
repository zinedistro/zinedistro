require 'spec_helper'

feature 'As a user' do

  before do
    sign_in

    create(:zine_with_authors,
           title: 'Zine 1',
           subtitle: 'Subtitle 1')
  end

  context ' On the admin index page' do
    before do
      visit admin_zines_path
    end

    scenario 'I can see a list of zine titles' do
      expect(page).to have_content "Zine 1"
    end

    scenario 'I can see a list of zine subtitiles' do
      expect(page).to have_content "Subtitle 1"
    end
  end
end
