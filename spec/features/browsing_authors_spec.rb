require 'spec_helper'
feature 'Browsing Zines' do
  let(:authors) { create_list :author_with_zines, 4 }
  let(:first_author_zines) { authors.first.zines }

  before do
    authors.each { |author| author.zines.map(&:publish!) }
  end

  context "As a user" do
    context "on the authors page" do
      before do
        visit root_path
        within "nav.links" do
          click_link I18n.t('authors.pluralized_title')
        end
      end

      scenario "I see a list of authors" do
        authors.each do |author|
          expect(page).to have_content(/\b#{author.name}\b/)
        end
      end

      context "When I click on an author" do
        before do
          click_link authors.first.name
        end

        scenario "I should see the author's detailed information" do
          within ".author-name" do
            expect(page).to have_content authors.first.name
          end
        end

        scenario "I can see the zine titles created by a given author" do
          titles = first_author_zines.map(&:title)
          titles.each do |title|
            expect(page).to have_content title
          end
        end

        scenario "I can see the zine subtitles created by a given author" do
          subtitles = first_author_zines.map(&:subtitle)
          subtitles.each do |subtitle|
            expect(page).to have_content subtitle
          end
        end
      end
    end
  end
end
