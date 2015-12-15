# filename: session_2_spec.rb

require 'session'
require 'session_two'

describe 'Participant navigates to session 2', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    session_two.open
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees start page' do
    expect(page).to have_content 'START NOW'
  end

  it 'is unable to move past \'session2_smokingstatus\' without responding'
  it 'responds to \'session2_smokingstatus\' with response 2'
  it 'responds to \'session2_smokingstatus\' with response 4'

  describe 'responds to \'session2_smokingstatus\' with response 1' do
    it 'responds to \'got_time\' with response 2'

    describe 'responds to \'got_time\' with response 1' do
      it 'responds to \'session2_strategies2\' with response 2'
      it 'responds to \'session2_strategies2\' with response 3'

      describe 'responds to \'session2_strategies2\' with response 1' do
        it 'previously responded to \'session1_social6\' with response 2'

        describe 'previously responded to \'session1_social6\' with 1' do
          it 'responds to \'session2_social_support_1\' with response 2'
          it 'responds to \'session2_social_support_1\' with response 3'
          it 'responds to \'session2_social_support_1\' with response 4'

          describe 'responds to \'session2_social_support_1\' with 1' do
            it 'responds to \'session2_traps\' with response 1'
            it 'responds to \'session2_traps\' with response 2'
            it 'responds to \'session2_traps\' with response 3'
            it 'responds to \'session2_traps\' with response 4'
            it 'responds to \'session2_traps\' with response 5'
            it 'responds to \'session2_traps\' with response 6'
            it 'responds to \'session2_traps\' with response 7'
            it 'responds to \'session2_traps\' with response 8'
            it 'responds to \'session2_traps\' with response 9'
            it 'responds to \'session2_traps\' with response 10'
            it 'responds to \'session2_checkingin4\' with response 2'
            it 'responds to \'session2_checkingin4\' with response 3'
            it 'responds to \'session2_checkingin4\' with response 4'

            describe 'responds to \'session2_checkingin4\' with response 1' do
              it 'completes Session Two'
            end
          end
        end
      end
    end
  end

  describe 'responds to \'session2_smokingstatus\' with response 3' do
    it 'responds to \'session2_reschedulingday\' with response 2'

    describe 'responds to session2_reschedulingday with response 1' do
      it 'responds to \'not_quit\' with response 1'
      it 'responds to \'not_quit\' with response 2'
    end
  end

  describe 'responds to \'session2_smokingstatus\' with response 5' do
    it 'responds to \'session2_notready2\' with response 1'
    it 'responds to \'session2_notready2\' with response 2'
    it 'responds to \'session2_notready2\' with response 3'
  end
end
