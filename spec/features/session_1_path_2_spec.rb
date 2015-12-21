# filename: path_2_session_1_spec.rb

# require page objects
require 'page_objects/session'
require 'page_objects/session_one'
require 'page_objects/quit_reason'
require 'page_objects/modal'
require 'page_objects/social'
require 'page_objects/cessation'
require 'page_objects/risky'
require 'page_objects/continue'
require 'page_objects/settings_page'

describe 'Participant loads app for the first time', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  describe 'responds question 1 with 3, responds to \'session1_5\' with 1' do
    it 'sees correct feedback' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide

      expect(page).to have_content 'You are not ready to quit at this time.'
    end

    it 'responds to \'session1_19b\' with 1' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide

      expect(page)
        .to have_content 'You\'ve decided to go ahead with a quit attempt'
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 1' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(2)
      session.move_to_next_slide
      session_one.assert_on_session1_notready
      session.move_to_next_slide
      session_one.assert_on_difficult_1
      session_one.open_risky_times

      enter_risky_times

      session.move_to_next_slide
      expect(page).to have_content 'Receiving Reminders To Stay on Track'

      # assert this ends session
      session.move_to_next_slide
      session.finish

      expect(modal).to be_disabled
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 2' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(2)
      session.move_to_next_slide
      session_one.assert_on_session1_notready
      session.move_to_next_slide

      session_one.assert_on_difficult_1
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'You have chosen not to identify any time' \
                                   's you might have difficulty to remain sm' \
                                   'oke-free.'

      # assert this ends session
      session.move_to_next_slide
      session.finish

      expect(modal).to be_disabled
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 2' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      find('h3', text: 'Congratulations')
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_19c
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 3'do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_19c
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(3)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 4' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_19c
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(4)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 5' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_19c
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(5)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 6' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_7
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_19c
      session.move_to_next_slide

      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(6)
      session.move_to_next_slide

      expect(page).to have_content 'You indicated "other"'

      session.set_notes
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 1' do
      it 'responds to \'session1_social6\' with 2' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide

        session_one.assert_on_social_support1
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'You\'ve decided to do this quit attemp' \
                                     't without any help'

        session.move_to_next_slide

        expect(page).to have_content 'Schedule Your Quit Day'
      end

      it 'responds to \'session1_social6\' with 1' do
        session.start
        find('h3',
             text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social10a

        expect(page).to have_content 'You have identified people who can hel' \
                                     'p you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 1, \'session1_schedule\' ' \
         'with 0' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social10a
        modal.open

        enter_social_supports

        session.move_to_next_slide
        session_one.assert_on_session1_schedule
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'That\'s ok'
      end

      describe 'responds to \'session1_social6\' with 1, ' \
               '\'session1_schedule\' with 1' do
        it 'responds to \'quitday_scheduled\' with 1' do
          session.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session.move_to_next_slide
          session_one.assert_on_session1_4
          session.move_to_next_slide
          modal.open

          enter_quit_reason

          session.move_to_next_slide
          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_benefits1
          session.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_7
          session.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_11
          session.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_19c
          session.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_21
          session.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social10a
          modal.open

          enter_social_supports

          session.move_to_next_slide
          session_one.assert_on_session1_schedule
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_ready

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'It should!'
        end

        it 'responds to \'quitday_scheduled\' with 0' do
          session.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session.move_to_next_slide
          session_one.assert_on_session1_4
          session.move_to_next_slide
          modal.open

          enter_quit_reason

          session.move_to_next_slide
          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_benefits1
          session.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_7
          session.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_11
          session.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_19c
          session.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_21
          session.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social10a
          modal.open

          enter_social_supports

          session.move_to_next_slide
          session_one.assert_on_session1_schedule
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_ready

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(2)
          session.move_to_next_slide
          expect(page).to have_content 'Good for you!'
        end

        it 'responds to \'difficult_1b\' with 1' do
          session.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session.move_to_next_slide
          session_one.assert_on_session1_4
          session.move_to_next_slide
          modal.open

          enter_quit_reason

          session.move_to_next_slide
          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_benefits1
          session.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_7
          session.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_11
          session.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_19c
          session.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_21
          session.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social10a
          modal.open

          enter_social_supports

          session.move_to_next_slide
          session_one.assert_on_session1_schedule
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_ready

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled2
          session.move_to_next_slide
          session_one.assert_on_difficult_1
          session_one.open_risky_times

          enter_risky_times

          session.move_to_next_slide
          session_one.assert_on_difficult2
          session.move_to_next_slide
          session_one.assert_on_ending
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          cessation_date.assert_on_ending2
          session.move_to_next_slide
          session.finish

          settings_page.assert_on_page
          settings_page.save

          expect(page).to have_css('#smokingStatus')
        end

        it 'responds to difficult_1b with 2' do
          session.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session.move_to_next_slide
          session_one.assert_on_session1_4
          session.move_to_next_slide
          modal.open

          enter_quit_reason

          session.move_to_next_slide
          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_benefits1
          session.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_7
          session.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_11
          session.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_19c
          session.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_21
          session.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social10a
          modal.open

          enter_social_supports

          session.move_to_next_slide
          session_one.assert_on_session1_schedule
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_ready

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled2
          session.move_to_next_slide
          session_one.assert_on_difficult_1
          answer_question_with(2)
          session.move_to_next_slide

          expect(page)
            .to have_content 'You have chosen not to identify any times you ' \
                             'might have difficulty to remain smoke-free.'

          session.move_to_next_slide
          session_one.assert_on_ending
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          cessation_date.assert_on_ending2
          session.move_to_next_slide
          session.finish

          settings_page.assert_on_page

          expect(modal).to be_disabled
        end
      end
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 7' do
      it 'sees correct feedback' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 3' do
    it 'goes through the correct path' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_8
      session.move_to_next_slide
      session_one.assert_on_session1_9
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_11
      session.move_to_next_slide
      session_one.assert_on_session1_19
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_21
      session.move_to_next_slide
      session_one.assert_on_session1_28
      session.move_to_next_slide

      expect(page).to have_content 'Identify your Social Support'
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 5' do
    it 'sees correct feedback' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(5)
      session.move_to_next_slide

      expect(page).to have_content 'You have already quit smoking,'
    end

    describe 'responds to \'social_support1\' with 1' do
      it 'responds to \'session1_social6\' with 1' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(5)
        session.move_to_next_slide
        session_one.assert_on_session1_8b
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social10a
        modal.open

        enter_social_supports

        session.move_to_next_slide
        session_one.assert_on_difficult_1

        expect(page).to have_content 'To help you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 0' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(5)
        session.move_to_next_slide
        session_one.assert_on_session1_8b
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(2)
        session.move_to_next_slide
        session_one.assert_on_session1_social9
        session.move_to_next_slide

        session_one.assert_on_difficult_1

        expect(page).to have_content 'To help you stay smoke-free'
      end
    end

    describe 'responds to \'social_support1\' with 7' do
      it 'responds to \'session1_social7\' with 1' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(7)
        session.move_to_next_slide
        session_one.assert_on_session1_social7
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'

        # assert this ends session
        session.move_to_next_slide
        session.finish

        expect(modal).to be_disabled
      end

      it 'responds to \'session1_social7\' with 0' do
        session.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session.move_to_next_slide
        session_one.assert_on_session1_4
        session.move_to_next_slide
        session_one.assert_on_session1_reasons
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_benefits1
        session.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_7
        session.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_11
        session.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_19c
        session.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_21
        session.move_to_next_slide

        session_one.assert_on_social_support1
        answer_question_with(7)
        session.move_to_next_slide
        session_one.assert_on_session1_social7
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'You feel that there is nobody in your ' \
                                     'life who would support your upcoming q' \
                                     'uit attempt.'

        # assert this ends session
        session.move_to_next_slide
        session.finish

        expect(modal).to be_disabled
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 6' do
    it 'goes through the correct path' do
      session.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_4
      session.move_to_next_slide
      session_one.assert_on_session1_reasons
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide
      session_one.assert_on_session1_benefits1
      session.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(6)
      session.move_to_next_slide

      expect(page).to have_content 'You have already quit smoking, and are u' \
                                   'sing this app, because you want to make ' \
                                   'sure that you won\'t relapse.'
    end
  end
end
