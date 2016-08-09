# frozen_string_literal: true

module Users
  # page object for Consent
  class ParticipantCreation
    include RSpec::Matchers
    include Capybara::DSL

    def click_participants
      first('.pjax', text: 'Participants').click
    end

    def click_add_new
      find('span', text: 'Add new').click
    end

    def enter_ptp_id
      find('#participant_external_id').set('TEST_ID')
    end

    def click_save
      find('.btn-primary', text: 'Save').click
    end

    def partial_scroll
      execute_script('window.scrollBy(0,750)')
    end
  end
end
