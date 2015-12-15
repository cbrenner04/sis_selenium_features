# filename: path_2_session_1_spec.rb

# require page objects
require 'session_one'
require 'quit_reason'
require 'modal'
require 'social_supports'
require 'cessation'
require 'risky'
require 'continue'
require 'settings_page'

describe 'Participant loads app for the first time', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  describe 'responds question 1 with 3, responds to \'session1_5\' with 1' do
    it 'sees correct feedback' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)

      expect(page).to have_content 'You are not ready to quit at this time.'
    end

    it 'responds to \'session1_19b\' with 1' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)

      expect(page)
        .to have_content 'You\'ve decided to go ahead with a quit attempt'
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 1' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(2)
      session_one.assert_on_session1_notready
      continue.move_to_next_slide

      enter_risky_times

      expect(page).to have_content 'Receiving Reminders To Stay on Track'
      # add path to home screen
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 2' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(2)
      session_one.assert_on_session1_notready
      continue.move_to_next_slide

      risky.assert_on_correct_page
      answer_question_with(2)

      expect(page).to have_content 'You have chosen not to identify any time' \
                                   's you might have difficulty to remain sm' \
                                   'oke-free.'
      # add path to home screen
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 2' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      find('h3', text: 'Congratulations')
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session_one.assert_on_session1_19c
      continue.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(2)

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 3'do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session_one.assert_on_session1_19c
      continue.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(3)

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 4' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session_one.assert_on_session1_19c
      continue.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(4)

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 5' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session_one.assert_on_session1_19c
      continue.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(5)

      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 6' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(1)
      session_one.assert_on_session1_7
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      answer_question_with(1)
      session_one.assert_on_session1_19c
      continue.move_to_next_slide

      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_social_support1
      answer_question_with(6)

      expect(page).to have_content 'You indicated "other"'

      session_one.set_notes
      continue.move_to_next_slide

      expect(page).to have_content 'Excellent!'
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 1' do
      it 'responds to \'session1_social6\' with 2' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide

        session_one.assert_on_social_support1
        answer_question_with(1)
        session_one.assert_on_session1_social6
        answer_question_with(2)

        expect(page).to have_content 'You\'ve decided to do this quit attemp' \
                                     't without any help'

        continue.move_to_next_slide

        expect(page).to have_content 'Schedule Your Quit Day'
      end

      it 'responds to \'session1_social6\' with 1' do
        session_one.start
        find('h3',
             text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session_one.assert_on_session1_social6
        answer_question_with(1)
        social_supports.assert_on_correct_page

        expect(page).to have_content 'You have identified people who can hel' \
                                     'p you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 1, \'session1_schedule\' ' \
         'with 0' do
        session_one.start
        find('h3',
             text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session_one.assert_on_session1_social6
        answer_question_with(1)
        enter_social_supports
        session_one.assert_on_session1_schedule
        answer_question_with(2)

        expect(page).to have_content 'That\'s ok'
      end

      describe 'responds to \'session1_social6\' with 1, ' \
               '\'session1_schedule\' with 1' do
        it 'sees correct feedback' do
          session_one.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session_one.assert_on_session1_4
          continue.move_to_next_slide

          enter_quit_reason

          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session_one.assert_on_session1_benefits1
          continue.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session_one.assert_on_session1_7
          continue.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session_one.assert_on_session1_11
          continue.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session_one.assert_on_session1_19c
          continue.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session_one.assert_on_session1_21
          continue.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session_one.assert_on_session1_social6
          answer_question_with(1)
          enter_social_supports
          session_one.assert_on_session1_schedule
          answer_question_with(1)

          expect(page).to have_content 'Splendid!'
        end

        it 'responds to \'quitday_scheduled\' with 1' do
          session_one.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session_one.assert_on_session1_4
          continue.move_to_next_slide

          enter_quit_reason

          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session_one.assert_on_session1_benefits1
          continue.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session_one.assert_on_session1_7
          continue.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session_one.assert_on_session1_11
          continue.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session_one.assert_on_session1_19c
          continue.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session_one.assert_on_session1_21
          continue.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session_one.assert_on_session1_social6
          answer_question_with(1)
          enter_social_supports
          session_one.assert_on_session1_schedule
          answer_question_with(1)

          enter_cessation_date

          session_one.assert_on_quitday_scheduled
          answer_question_with(1)

          expect(page).to have_content 'It should!'
        end

        it 'responds to \'quitday_scheduled\' with 0' do
          session_one.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session_one.assert_on_session1_4
          continue.move_to_next_slide

          enter_quit_reason

          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session_one.assert_on_session1_benefits1
          continue.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session_one.assert_on_session1_7
          continue.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session_one.assert_on_session1_11
          continue.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session_one.assert_on_session1_19c
          continue.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session_one.assert_on_session1_21
          continue.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session_one.assert_on_session1_social6
          answer_question_with(1)
          enter_social_supports
          session_one.assert_on_session1_schedule
          answer_question_with(1)

          enter_cessation_date

          session_one.assert_on_quitday_scheduled
          answer_question_with(2)
          expect(page).to have_content 'Good for you!'
        end

        it 'responds to \'difficult_1b\' with 1' do
          session_one.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session_one.assert_on_session1_4
          continue.move_to_next_slide

          enter_quit_reason

          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session_one.assert_on_session1_benefits1
          continue.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session_one.assert_on_session1_7
          continue.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session_one.assert_on_session1_11
          continue.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session_one.assert_on_session1_19c
          continue.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session_one.assert_on_session1_21
          continue.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session_one.assert_on_session1_social6
          answer_question_with(1)
          enter_social_supports
          session_one.assert_on_session1_schedule
          answer_question_with(1)

          enter_cessation_date

          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session_one.assert_on_quitday_scheduled2
          continue.move_to_next_slide

          enter_risky_times

          session_one.assert_on_difficult2
          continue.move_to_next_slide
          session_one.assert_on_ending
          continue.move_to_next_slide
          session_one.assert_on_session1_social6
          cessation_date.assert_on_ending2
          continue.move_to_next_slide
          session_one.finish

          settings_page.assert_on_page
          settings_page.save

          expect(page).to have_css('#smokingStatus')
        end

        it 'responds to difficult_1b with 2' do
          session_one.start
          session_one.assert_on_session1_1
          answer_question_with(3)
          session_one.assert_on_session1_4
          continue.move_to_next_slide

          enter_quit_reason

          session_one.assert_on_session1_benefits
          answer_question_with(1)
          session_one.assert_on_session1_benefits1
          continue.move_to_next_slide
          session_one.assert_on_session1_5
          answer_question_with(1)
          session_one.assert_on_session1_7
          continue.move_to_next_slide
          session_one.assert_on_session1_10
          answer_question_with(1)
          session_one.assert_on_session1_11
          continue.move_to_next_slide
          session_one.assert_on_session1_19
          answer_question_with(1)
          session_one.assert_on_session1_19c
          continue.move_to_next_slide
          session_one.assert_on_session1_20
          answer_question_with(1)
          session_one.assert_on_session1_21
          continue.move_to_next_slide
          session_one.assert_on_social_support1
          answer_question_with(1)
          session_one.assert_on_session1_social6
          answer_question_with(1)

          enter_social_supports

          session_one.assert_on_session1_schedule
          answer_question_with(1)
          enter_cessation_date
          session_one.assert_on_quitday_scheduled
          answer_question_with(1)
          session_one.assert_on_quitday_scheduled2
          continue.move_to_next_slide
          risky.assert_on_correct_page
          answer_question_with(2)

          expect(page)
            .to have_content 'You have chosen not to identify any times you ' \
                             'might have difficulty to remain smoke-free.'

          continue.move_to_next_slide
          session_one.assert_on_ending
          continue.move_to_next_slide
          session_one.assert_on_session1_social6
          cessation_date.assert_on_ending2
          continue.move_to_next_slide
          session_one.finish

          settings_page.assert_on_page

          expect(page).to_not have_css('#save_button')
        end
      end
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 7' do
      it 'sees correct feedback' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(7)

        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 3' do
    it 'goes through the correct path' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(3)
      session_one.assert_on_session1_8
      continue.move_to_next_slide
      session_one.assert_on_session1_9
      continue.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session_one.assert_on_session1_11
      continue.move_to_next_slide
      session_one.assert_on_session1_19
      continue.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session_one.assert_on_session1_21
      continue.move_to_next_slide
      session_one.assert_on_session1_28
      continue.move_to_next_slide

      expect(page).to have_content 'Identify your Social Support'
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 5' do
    it 'sees correct feedback' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(5)

      expect(page).to have_content 'You have already quit smoking,'
    end

    describe 'responds to \'social_support1\' with 1' do
      it 'responds to \'session1_social6\' with 1' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(5)
        session_one.assert_on_session1_social8b
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session_one.assert_on_session1_social6
        answer_question_with(1)

        enter_social_supports

        risky.assert_on_correct_page
        expect(page).to have_content 'To help you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 0' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(5)
        session_one.assert_on_session1_social8b
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(1)
        session_one.assert_on_session1_social6
        answer_question_with(2)
        session_one.assert_on_session1_social9
        continue.move_to_next_slide
        risky.assert_on_correct_page

        expect(page).to have_content 'To help you stay smoke-free'
      end
    end

    describe 'responds to \'social_support1\' with 7' do
      it 'sees correct feedback' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(7)

        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
      end

      it 'responds to \'session1_social7\' with 1' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide
        session_one.assert_on_social_support1
        answer_question_with(7)
        session_one.assert_on_session1_social7
        answer_question_with(1)

        expect(page).to have_content 'Excellent!'

        # add path to home screen
      end

      it 'responds to \'session1_social7\' with 0' do
        session_one.start
        session_one.assert_on_session1_1
        answer_question_with(3)
        session_one.assert_on_session1_4
        continue.move_to_next_slide

        enter_quit_reason

        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session_one.assert_on_session1_benefits1
        continue.move_to_next_slide
        session_one.assert_on_session1_5
        answer_question_with(1)
        session_one.assert_on_session1_7
        continue.move_to_next_slide
        session_one.assert_on_session1_10
        answer_question_with(1)
        session_one.assert_on_session1_11
        continue.move_to_next_slide
        session_one.assert_on_session1_19
        answer_question_with(1)
        session_one.assert_on_session1_19c
        continue.move_to_next_slide
        session_one.assert_on_session1_20
        answer_question_with(1)
        session_one.assert_on_session1_21
        continue.move_to_next_slide

        session_one.assert_on_social_support1
        answer_question_with(7)
        session_one.assert_on_session1_social7
        answer_question_with(2)

        expect(page).to have_content 'You feel that there is nobody in your ' \
                                     'life who would support your upcoming q' \
                                     'uit attempt.'

        # add path to home screen
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 6' do
    it 'goes through the correct path' do
      session_one.start
      session_one.assert_on_session1_1
      answer_question_with(3)
      session_one.assert_on_session1_4
      continue.move_to_next_slide

      enter_quit_reason

      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session_one.assert_on_session1_benefits1
      continue.move_to_next_slide
      session_one.assert_on_session1_5
      answer_question_with(6)

      expect(page).to have_content 'You have already quit smoking, and are u' \
                                   'sing this app, because you want to make ' \
                                   'sure that you won\'t relapse.'
    end
  end
end
