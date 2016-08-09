# frozen_string_literal: true

module Users
  # page object for Consent
  class Login
    include RSpec::Matchers
    include Capybara::DSL

    def sign_in
      find('#user_email').set(ENV['User_Email'])
      find('#user_password').set(ENV['User_Password'])
      click_on 'Sign in'
    end

    def sign_out
      find('.navbar-toggle').click
      click_on 'Log out'
    end
  end
end
