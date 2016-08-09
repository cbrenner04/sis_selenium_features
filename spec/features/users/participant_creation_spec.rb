# frozen_string_literal: true
# filename: ./spec/features/users/participant_creation_spec.rb

require './lib/pages/users/participant_creation'
require './lib/pages/users/login'

def create_ptp_login
  @create_ptp_login ||= Users::Login.new
end

def participant_creation
  @participant_creation ||= Users::ParticipantCreation.new
end

feature 'A user', metadata: :user do
  scenario 'creates a participant' do
    visit ENV['Dash_URL']
    create_ptp_login.sign_in
    participant_creation.click_participants
    participant_creation.click_add_new
    participant_creation.enter_ptp_id
    participant_creation.click_save

    expect(page).to have_content 'TEST_ID'
  end
end
