# frozen_string_literal: true
# filename: ./spec/features/users/login_spec.rb

require './lib/pages/users/login.rb'

def login
  @login ||= Users::Login.new
end

feature 'A user', metadata: :user do
  scenario 'succefully signs in' do
    visit ENV['Dash_URL']

    login.sign_in

    expect(page).to have_content 'Site Administration'

    login.sign_out

    expect(page).to have_content 'Sign in'
  end
end
