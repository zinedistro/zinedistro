require "spec_helper"
feature "Deleing Authors" do
  let(:user) { create :user }
  let!(:author) { create :author }

  before do
    sign_in user
  end

  scenario "Visiting the author page" do
    visit admin_authors_path
    expect(page).to have_link t("authors.pluralized_title")
    click_link t("active_admin.delete")
    expect(page).to have_content destroy_message_for :author
  end
end
