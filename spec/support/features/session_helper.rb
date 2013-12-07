# From http://robots.thoughtbot.com/rspec-integration-tests-with-capybara
module Features
  # Namespace our helpers
  module SessionHelpers
    def sign_up_with(email, password)
      visit user_sign_up_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign up'
    end

    def sign_in(user_to_log_in = nil)
      user = user_to_log_in || create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end
  end
end
