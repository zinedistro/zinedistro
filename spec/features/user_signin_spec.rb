require "rails_helper"

feature "Reset password" do
  let(:user) { create :user }
  scenario "User can reset password" do
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in :user_email, with: user.email
    click_button "Reset My Password"
    expect(page).to have_content t("devise.passwords.send_instructions")
  end
end
