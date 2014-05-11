require 'spec_helper'

feature 'Browsing the site' do
  before do
    visit root_path
  end
  context 'Site footer' do
    scenario 'I can see attribution content' do
      within 'footer#bottom' do
        find("a[href='https://twitter.com/faunzy']") do
          expect(page).to have_content 'maintained by Faun'
        end
      end
    end

    scenario 'I can see a link to the resistance army site' do
      within 'footer#bottom' do
        find("a[href='http://theresistancearmy.com/']") do
          expect(page).to have_content 'A Resistance Army Project'
        end
      end
    end
  end
end
