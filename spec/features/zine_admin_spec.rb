require 'rails_helper'
feature 'As a user' do
  let!(:zine) do
    create(:zine_with_authors,
           title: 'Zine 1',
           subtitle: 'Subtitle 1')
  end

  before do
    sign_in
  end

  context ' On the admin index page' do
    before do
      visit admin_zines_path
    end

    scenario 'I can click through to the zine detail page' do
      within "#zine_#{zine.id} .col-id" do
        expect(page).to have_link(zine.id, href: admin_zine_path(zine))
      end
    end

    scenario 'I can see the zine titles' do
      within "#zine_#{zine.id} .col-title" do
        expect(page).to have_content 'Zine 1'
      end
    end

    scenario 'I can see the zine subtitle' do
      within "#zine_#{zine.id} .col-subtitle" do
        expect(page).to have_content 'Subtitle 1'
      end
    end

    scenario 'I can see the zine created_at date' do
      within "#zine_#{zine.id} .col-created_at" do
        expect(page).to have_content zine.created_at.to_formatted_s(:long)
      end
    end

    scenario 'I can see the zine updated_at date' do
      within "#zine_#{zine.id} .col-updated_at" do
        expect(page).to have_content zine.updated_at.to_formatted_s(:long)
      end
    end

    scenario 'I can see the zine published status' do
      within "#zine_#{zine.id} .col-published" do
        expect(page).to have_content 'Yes'
      end
    end
  end
end
