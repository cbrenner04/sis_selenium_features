# frozen_string_literal: true
# filename: path_2_session_1_spec.rb

# require session_1_helper, this has the `move_from...to` methods
require 'support/session_1_helper'

feature 'Participant loads app for the first time' do
  before { visit ENV['Base_URL'] }

  after { navigation.clear_data }

  feature 'responds question 1 with 3, responds to \'session1_5\' with 1' do
    scenario 'responds to \'session1_19b\' with 1' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      session_one.assert_on_session1_19b
      answer_question_with(1)
      session.move_to_next_slide

      expect(page)
        .to have_content 'You\'ve decided to go ahead with a quit attempt'
    end

    scenario 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 1' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      session_one.assert_on_session1_19b
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

      expect(page).to have_css('#smokingStatus')
    end

    scenario 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 2' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      session_one.assert_on_session1_19b
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

      expect(page).to have_css('#smokingStatus')
    end

    scenario 'responds to \'session1_19b\' with 1, \'social_support\' with 2' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      move_from_session1_19b_to_social_support1
      session_one.assert_on_social_support1
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    scenario 'responds to \'session1_19b\' with 1, \'social_support\' with 3' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      move_from_session1_19b_to_social_support1
      session_one.assert_on_social_support1
      answer_question_with(3)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    scenario 'responds to \'session1_19b\' with 1, \'social_support\' with 4' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      move_from_session1_19b_to_social_support1
      session_one.assert_on_social_support1
      answer_question_with(4)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    scenario 'responds to \'session1_19b\' with 1, \'social_support\' with 5' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      move_from_session1_19b_to_social_support1
      session_one.assert_on_social_support1
      answer_question_with(5)
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    scenario 'responds to \'session1_19b\' with 1, \'social_support\' with 6' do
      move_to_quit_reason
      modal.open

      enter_quit_reason

      move_from_reason_to_session1_19b
      move_from_session1_19b_to_social_support1
      session_one.assert_on_social_support1
      answer_question_with(6)
      session.move_to_next_slide

      expect(page).to have_content 'You indicated "other"'

      session.set_notes
      session.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    feature 'responds to \'session1_19b\' with 1, \'social_support\' with 1' do
      scenario 'responds to \'session1_social6\' with 2' do
        move_to_quit_reason
        modal.open

        enter_quit_reason

        move_from_reason_to_session1_19b
        move_from_session1_19b_to_social_support1

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

      scenario 'responds to \'session1_social6\' with 1' do
        move_to_quit_reason
        modal.open

        enter_quit_reason

        move_from_reasons_to_supports_2

        expect(page).to have_content 'You have identified people who can hel' \
                                     'p you stay smoke-free'
      end

      scenario "responds to 'session1_social6' w 1, 'session1_schedule' w 0" do
        move_to_quit_reason
        modal.open

        enter_quit_reason

        move_from_reasons_to_supports_2
        modal.open

        enter_social_supports

        session.move_to_next_slide
        session_one.assert_on_session1_schedule
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'That\'s ok'
      end

      feature "responds to 'session1_social6' w 1, 'session1_schedule' w 1" do
        scenario 'responds to \'quitday_scheduled\' with 1' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reasons_to_supports_2
          modal.open

          enter_social_supports

          move_from_supports_to_quit_date

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'It should!'
        end

        scenario 'responds to \'quitday_scheduled\' with 0' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reasons_to_supports_2
          modal.open

          enter_social_supports

          move_from_supports_to_quit_date

          enter_cessation_date

          session.move_to_next_slide
          session_one.assert_on_quitday_scheduled
          answer_question_with(2)
          session.move_to_next_slide
          expect(page).to have_content 'Good for you!'
        end

        scenario 'responds to \'difficult_1b\' with 1' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reasons_to_supports_2
          modal.open

          enter_social_supports

          move_from_supports_to_quit_date

          enter_cessation_date

          move_from_quit_date_to_risky_times
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

          expect(page).to have_css('#smokingStatus')
        end

        scenario 'responds to difficult_1b with 2' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reasons_to_supports_2
          modal.open

          enter_social_supports

          move_from_supports_to_quit_date

          enter_cessation_date

          move_from_quit_date_to_risky_times
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

          expect(page).to have_css('#smokingStatus')
        end
      end
    end

    feature 'responds to \'session1_19b\' with 1, \'social_support\' with 7' do
      scenario 'sees correct feedback' do
        move_to_quit_reason
        modal.open

        enter_quit_reason

        move_from_reason_to_session1_19b
        move_from_session1_19b_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
      end
    end
  end

  feature 'responds to question 1 with 3, responds to \'session1_5\' with 3' do
    scenario 'goes through the correct path' do
      move_to_quit_reason
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

  feature 'responds to question 1 with 3, responds to \'session1_5\' with 5' do
    scenario 'sees correct feedback' do
      move_to_quit_reason
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

    feature 'responds to \'social_support1\' with 1' do
      scenario 'responds to \'session1_social6\' with 1' do
        move_to_quit_reason
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

      scenario 'responds to \'session1_social6\' with 0' do
        move_to_quit_reason
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

    feature 'responds to \'social_support1\' with 7' do
      scenario 'responds to \'session1_social7\' with 1' do
        move_to_quit_reason
        modal.open

        enter_quit_reason

        move_from_reason_to_session1_19b
        move_from_session1_19b_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(7)
        session.move_to_next_slide
        session_one.assert_on_session1_social7
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social6
        answer_question_with(1)
        session.move_to_next_slide
        session_one.assert_on_session1_social10b

        modal.open
        enter_social_supports

        session.move_to_next_slide

        expect(page).to have_content 'Schedule Your Quit Day'
      end

      feature 'responds to \'session1_social7\' with 2' do
        scenario 'responds to \'session1_social8\' with response 1' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reason_to_session1_19b
          move_from_session1_19b_to_social_support1

          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social8
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social9b
          session.move_to_next_slide

          expect(page).to have_content 'Schedule Your Quit Day'
        end

        scenario 'responds to \'session1_social8\' with response 2' do
          move_to_quit_reason
          modal.open

          enter_quit_reason

          move_from_reason_to_session1_19b
          move_from_session1_19b_to_social_support1

          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social8
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social9
          session.move_to_next_slide

          expect(page).to have_content 'Schedule Your Quit Day'
        end
      end
    end
  end

  feature 'responds to question 1 with 3, responds to \'session1_5\' with 6' do
    scenario 'goes through the correct path' do
      move_to_quit_reason
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
