require "spec_helper"
feature "When Browsing Zines" do
  describe "On the index page" do

    let!(:first_zine) { create :zine, title: "Zine 1" }
    let!(:second_zine) { create :zine, title: "Zine 2" }
    let!(:unpublished_zine) { create :unpublished_zine, title: "Super Secret" }

    before do
      visit "/zines"
    end

    scenario "I can see zines titles on the index page" do
      page.should have_content first_zine.title
    end

    scenario "I can see zines sorted by date in descending order" do
      page.body.should =~ /Zine 2.*Zine 1/m
    end

    scenario "I can see the authors' names" do
      page.should have_content "by #{first_zine.authors.map(&:name).join(", ")}"
    end

    scenario "I can see a summary" do
      page.should have_content first_zine.excerpt
    end

    scenario "I do not see unpublished zines" do
      page.should have_no_content unpublished_zine.title
    end

    describe "On the zine details page" do

      before do
        click_link first_zine.title
      end

      scenario "I can see the cover image" do
        page.should have_selector "img[src='#{first_zine.cover_url}']"
      end

      scenario "I can see the full text" do
        page.should have_content first_zine.full_text
      end

      scenario "I can download a PDF of the zine" do
        page.should have_css "a[href='#{first_zine.download_url}']"
      end
    end
  end
end
