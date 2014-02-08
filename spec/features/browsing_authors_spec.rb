require 'spec_helper'
feature 'Browsing Zines' do
  let(:authors) { create_list :author_with_zines, 4 }
  before do
    authors.each { |author| author.zines.map(&:publish!) }
  end
  context 'As a user' do
    context 'on the authors page' do

      before do
        visit authors_path
      end

      scenario 'I see a list of authors' do
        page.should have_content authors.reverse.map(&:name).join(' ')
      end

      context 'When I click on an author' do
        before do
          click_link authors.first.name
        end

        scenario "I should see the author's detailed information" do
          within '.author .name' do
            page.should have_content authors.first.name
          end
        end
        scenario 'I can see the zines created by a given author'

      end
    end
  end
end
