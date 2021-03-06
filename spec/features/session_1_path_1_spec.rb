# frozen_string_literal: true
# filename: path_1_session_1_spec.rb

# require session_1_helper, this has the `move_from...to` methods
require 'support/session_1_helper'

feature 'Participant loads app for the first time' do
  background { visit ENV['Base_URL'] }

  after { navigation.clear_data }

  scenario 'is unable to move forward from question 1 without responding' do
    move_to_session1_1

    expect(continue).to be_disabled
  end

  scenario 'responds to question 1 with response 2' do
    move_to_session1_1
    answer_question_with(2)
    move_from_session1_1_to_promoting_happiness

    expect(page).to have_content 'Promoting Happiness to be Smoke-free'
  end

  scenario 'responds to question 1 with response 4' do
    move_to_session1_1
    answer_question_with(4)
    session.move_to_next_slide
    session_one.enter_number_of_cigs_smoked('10')
    session.move_to_next_slide

    expect(page).to have_content 'That\'s great!'

    session.move_to_next_slide
    session_one.assert_on_session1_promoting_happiness
  end

  scenario 'cannot enter non-integer for number of cigs smoked' do
    move_to_session1_1
    answer_question_with(1)
    session.move_to_next_slide
    session_one.enter_number_of_cigs_smoked('asdf')

    expect(session_one).to_not have_num_of_cigs_smoked_visible('asdf')
  end

  feature 'responds to question 1 with response 1' do
    scenario 'is unalbe to move past \'promoting_happines\'' \
               'without responding' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down

      expect(continue).to be_disabled
    end

    scenario 'response to \'promoting_happines\' with \'Three Good Things\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_three_good_things
      session.move_to_next_slide

      expect(page).to have_content 'Three Good Things'
    end

    scenario 'response to \'promoting_happines\' with \'Savoring\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_savoring
      session.move_to_next_slide

      expect(page).to have_content 'Savoring'
    end

    scenario 'response to \'promoting_happines\' with' \
               '\'Experiencing Kindness\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_experiencing_kindness
      session.move_to_next_slide

      expect(page).to have_content 'Experiencing Kindness'
    end

    scenario 'response to \'promoting_happines\' with \'Three Good Things\'' \
               'and \'Savoring\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_three_good_things
      session_one.select_savoring
      session.move_to_next_slide

      expect(page).to have_content 'Three Good Things'

      session.move_to_next_slide

      expect(page).to have_content 'Savoring'
    end

    scenario 'response to \'promoting_happines\' with \'Three Good Things\'' \
               'and \'Experiencing Kindness\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_three_good_things
      session_one.select_experiencing_kindness
      session.move_to_next_slide

      expect(page).to have_content 'Three Good Things'

      session.move_to_next_slide

      expect(page).to have_content 'Experiencing Kindness'
    end

    scenario 'response to \'promoting_happines\' with \'Three Good Things\'' \
               'and \'Experiencing Kindness\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_savoring
      session_one.select_experiencing_kindness
      session.move_to_next_slide

      expect(page).to have_content 'Savoring'

      session.move_to_next_slide

      expect(page).to have_content 'Experiencing Kindness'
    end

    scenario 'response to \'promoting_happines\' with \'Three Good Things\',' \
               '\'Savoring\', and \'Experiencing Kindness\'' do
      move_to_session1_1
      answer_question_with(1)
      move_from_session1_1_to_promoting_happiness
      scroll_down
      session_one.select_three_good_things
      session_one.select_savoring
      session_one.select_experiencing_kindness
      session.move_to_next_slide

      expect(page).to have_content 'Three Good Things'

      session.move_to_next_slide

      expect(page).to have_content 'Savoring'

      session.move_to_next_slide

      expect(page).to have_content 'Experiencing Kindness'
    end

    feature 'response to \'promoting_happines\' with \'Three Good Things\'' do
      scenario 'is unable to move past \'session1_reasons\'' \
                 'without responding' do
        move_from_session1_1_to_reason

        expect(continue).to be_disabled
      end

      scenario 'is unable to save without responding to \'session1_reasons\'' do
        move_from_session1_1_to_reason
        modal.open

        expect(modal).to be_disabled
      end

      scenario 'sets a Quit Reason' do
        move_from_session1_1_to_reason
        modal.open
        quit_reason.create
        modal.save

        expect(quit_reason).to be_visible

        modal.exit
        session_one.assert_on_session1_reasons
      end

      scenario 'is unable to move past \'session1_benefits\'' \
                 'with no response' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits

        expect(continue).to be_disabled
      end

      scenario 'responds to \'session1_benefits\' with response 1' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'Healthy Changes Over Time'
      end

      scenario 'responds to question \'session1_benefits\' with response 2' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Feel Better'
      end

      scenario 'responds to question \'session1_benefits\' with response 3' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Look Better'
      end

      scenario 'responds to question \'session1_benefits\' with response 4' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'Smell Better'
      end

      scenario 'responds to question \'session1_benefits\' with response 5' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'Reduce Your Risk of Heart Disease'
      end

      scenario 'responds to question \'session1_benefits\' with response 6' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'Reduce Your Risk of Cancer'
      end

      scenario 'responds to question \'session1_benefits\' with response 7' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'Protect Your Family - ' \
                                       'including your pets!'
      end

      scenario 'responds to question \'session1_benefits\' with response 8' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(8)
        session.move_to_next_slide

        expect(page).to have_content 'Starting a Family'
      end

      scenario 'responds to question \'session1_benefits\' with response 9' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(9)
        session.move_to_next_slide

        expect(page).to have_content 'Save Money'
      end

      scenario 'responds to question \'session1_benefits\' with response 10' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(10)
        session.move_to_next_slide

        expect(page).to have_content 'Be Hassle-Free'
      end

      scenario 'responds to question \'session1_benefits\' with response 11' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(11)
        session.move_to_next_slide

        expect(page).to have_content 'More in Control'
      end

      scenario 'responds to question \'session1_benefits\' with response 12' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(12)
        session.move_to_next_slide

        expect(page).to have_content 'Be Guilt-free'
      end

      scenario 'responds to question \'session1_benefits\' with response 13' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(13)
        session.move_to_next_slide

        expect(page).to have_content 'Protect the Environment'
      end

      scenario 'responds to question \'session1_benefits\' with response 14' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(14)
        session.move_to_next_slide

        expect(page).to have_content 'Say "no!" to Big Tobacco'
      end

      scenario 'responds to question \'session1_benefits\' with response 15' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        session.move_to_next_slide
        session_one.assert_on_session1_benefits
        answer_question_with(15)
        session.move_to_next_slide

        expect(page).to have_content 'Ready to Quit?'
      end

      scenario 'cannot move past \'session1_5\' without responding' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        session_one.assert_on_session1_5

        expect(continue).to be_disabled
      end

      scenario 'responds to \'session1_5\' with response 2' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        session_one.assert_on_session1_5
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'You are not ready to quit at this time.'
      end

      scenario 'responds to \'session1_5\' with response 3' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
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

      scenario 'responds to \'session1_5\' with response 4' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        session_one.assert_on_session1_5
        answer_question_with(4)
        session.move_to_next_slide
        session_one.assert_on_session1_6
        session.move_to_next_slide

        expect(page).to have_content 'Preparing for Your Quit Day'
      end

      scenario 'responds to \'session1_5\' with response 6' do
        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        session_one.assert_on_session1_5
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'You have already quit smoking, and ' \
                                     'are using this app, because you want ' \
                                     'to make sure that you won\'t relapse.'
      end

      feature 'responds to \'session1_5\' with response 1' do
        scenario 'cannot move past \'session1_10\' without responding' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10

          expect(continue).to be_disabled
        end

        scenario 'responds to \'session1_10\' with response 1' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'You\'re concerned that you\'ll feel ' \
                                       'tired without a cigarette.'
        end

        scenario 'responds to \'session1_10\' with response 2' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'You worry that your urges to smoke ' \
                                       'will be so strong that you won\'t ' \
                                       'be able to stand it.'
        end

        scenario 'responds to \'session1_10\' with response 3' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(3)
          session.move_to_next_slide

          expect(page).to have_content 'You mentioned that smoking ' \
                                       'cigarettes gives you a lift ' \
                                       'when you\'re feeling down.'
        end

        scenario 'responds to \'session1_10\' with response 4' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(4)
          session.move_to_next_slide

          expect(page).to have_content 'It\'s hard to quit when others are ' \
                                       'smoking around you.'
        end

        scenario 'responds to \'session1_10\' with response 5' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(5)
          session.move_to_next_slide

          expect(page).to have_content 'You think you won\'t have the ' \
                                       'willpower to quit smoking.'
        end

        scenario 'responds to \'session1_10\' with response 6' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(6)
          session.move_to_next_slide

          expect(page).to have_content 'You worry that you\'ll be hungry, ' \
                                       'eat more, or gain weight.'
        end

        scenario 'responds to \'session1_10\' with response 7' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(7)
          session.move_to_next_slide

          expect(page).to have_content 'You\'ve selected "other".'

          session.set_notes
        end

        scenario 'responds to \'session1_10\' with response 8' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          session_one.assert_on_session1_10
          answer_question_with(8)
          session.move_to_next_slide

          expect(page).to have_content 'You have no concerns at all about ' \
                                       'quitting smoking...'
        end

        scenario 'cannot move past \'session1_19b\' without responding' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          session_one.assert_on_session1_19b

          expect(continue).to be_disabled
        end

        scenario 'responds to \'session1_19b\' with response 1' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          session_one.assert_on_session1_19b
          answer_question_with(1)
          session.move_to_next_slide

          expect(page)
            .to have_content 'You\'ve decided to go ahead with a quit attempt'
        end

        scenario 'responds to \'session1_19b\' with response 2' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          session_one.assert_on_session1_19b
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'You\'ve decided that now is not the ' \
                                       'right time for you to schedule and ' \
                                       'prepare for your quit day.'

          # Now assert this ends the session
          session.move_to_next_slide

          expect(page).to have_css('#smokingStatus')
        end

        scenario 'cannot move past \'session1_20\' without responding' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20

          expect(continue).to be_disabled
        end

        scenario 'responds to \'session1_20\' with response 1' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(1)
          session.move_to_next_slide

          expect(page)
            .to have_content 'Dealing with Negative Emotions w/o Smoking'
        end

        scenario 'responds to \'session1_20\' with response 2' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'Smoke-free Happiness'
        end

        scenario 'responds to \'session1_20\' with response 3' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(3)
          session.move_to_next_slide

          expect(page).to have_content 'Social Situations'
        end

        scenario 'responds to \'session1_20\' with response 4' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(4)
          session.move_to_next_slide

          expect(page).to have_content 'Drinking Alcohol'
        end

        scenario 'responds to \'session1_20\' with response 5' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(5)
          session.move_to_next_slide

          expect(page).to have_content 'Breaking the Habit'
        end

        scenario 'responds to \'session1_20\' with response 6' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(6)
          session.move_to_next_slide

          expect(page).to have_content 'You have selected "other"'

          session.set_notes
        end

        scenario 'responds to \'session1_20\' with response 7' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          session_one.assert_on_session1_20
          answer_question_with(7)
          session.move_to_next_slide

          expect(page).to have_content 'You have no triggers for smoking.'
        end

        scenario 'cannot move past \'social_support1\' without responding' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1

          expect(continue).to be_disabled
        end

        scenario 'responds to \'social_support1\' with response 2' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        scenario 'responds to \'social_support1\' with response 3' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(3)
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        scenario 'responds to \'social_support1\' with response 4' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(4)
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        scenario 'responds to \'social_support1\' with response 5' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(5)
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        scenario 'responds to \'social_support1\' with response 6' do
          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(6)
          session.move_to_next_slide

          expect(page).to have_content 'You indicated "other"'

          session.set_notes
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        feature 'responds to \'social_support1\' with response 1' do
          scenario 'cannot move past \'session1_social6\' without responding' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            session_one.assert_on_social_support1
            answer_question_with(1)
            session.move_to_next_slide
            session_one.assert_on_session1_social6

            expect(continue).to be_disabled
          end

          scenario 'responds to \'session1_social6\' with response 2' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            session_one.assert_on_social_support1
            answer_question_with(1)
            session.move_to_next_slide
            session_one.assert_on_session1_social6
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'You\'ve decided to do this quit ' \
                                         'attempt without any help'

            session.move_to_next_slide

            expect(page).to have_content 'Schedule Your Quit Day'
          end

          feature 'responds to \'session1_social6\' with response 1' do
            scenario 'cannot save without entering a Social Support' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_session1_benefits_to_session1_5
              move_from_session1_5_to_session1_10
              move_from_session1_10_to_session1_19b
              move_from_session1_19b_to_session1_20
              move_from_session1_20_to_social_support1
              move_from_social_support1_to_session1_social10a

              session_one.assert_on_session1_social10a
              modal.open
              expect(modal).to be_disabled
            end

            scenario 'enters a Social Support' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_session1_benefits_to_session1_5
              move_from_session1_5_to_session1_10
              move_from_session1_10_to_session1_19b
              move_from_session1_19b_to_session1_20
              move_from_session1_20_to_social_support1
              move_from_social_support1_to_session1_social10a

              session_one.assert_on_session1_social10a
              modal.open
              expect(modal).to be_disabled
              social_supports.create
              modal.save
              expect(social_supports).to be_visible
              modal.exit
              session_one.assert_on_session1_social10a
            end

            scenario 'cannot move past \'session1_schedule\' ' \
                     'with no response' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              session.move_to_next_slide
              session_one.assert_on_session1_schedule

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session_schedule\' with 2' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              session.move_to_next_slide
              session_one.assert_on_session1_schedule
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'That\'s ok'

              # assert this finishes the session
              session.move_to_next_slide

              expect(page).to have_css('#smokingStatus')
            end

            feature 'responds to \'session1_schedule\' with response 1' do
              scenario 'cannot move past \'quitday_ready\' ' \
                       'without responding' do
                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                expect(continue).to be_disabled
              end

              scenario 'schedules a Quit Day' do
                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                session.move_to_next_slide
                session_one.assert_on_session1_schedule
                answer_question_with(1)
                session.move_to_next_slide

                session_one.assert_on_quitday_ready
                cessation_date.open
                cessation_date.pick_date

                expect(cessation_date).to be_visible
              end

              scenario "cannot move past 'quitday_scheduled' " \
                       'with no response' do
                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                session.move_to_next_slide
                session_one.assert_on_quitday_scheduled

                expect(continue).to be_disabled
              end

              scenario 'responds to \'quitday_scheduled\' with response 2' do
                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                session.move_to_next_slide
                session_one.assert_on_quitday_scheduled
                answer_question_with(2)
                session.move_to_next_slide

                expect(page).to have_content 'Good for you!'

                session.move_to_next_slide

                expect(page).to have_content 'Difficult Times To Stay ' \
                                             'Smoke Free'
              end

              feature 'responds to \'quitday_scheduled\' with response 1' do
                scenario 'cannot move past \'difficult_1\' ' \
                         'without responding' do
                  move_from_session1_1_to_reason
                  modal.open

                  enter_quit_reason

                  move_from_reason_to_supports
                  modal.open

                  enter_social_supports

                  move_from_supports_to_quit_date

                  enter_cessation_date

                  move_from_quit_date_to_difficult_1
                  session_one.assert_on_difficult_1

                  expect(continue).to be_disabled
                end

                scenario 'responds to \'difficult_1\' with response 2' do
                  move_from_session1_1_to_reason
                  modal.open

                  enter_quit_reason

                  move_from_reason_to_supports
                  modal.open

                  enter_social_supports

                  move_from_supports_to_quit_date

                  enter_cessation_date

                  move_from_quit_date_to_difficult_1
                  session_one.assert_on_difficult_1
                  answer_question_with(2)
                  session.move_to_next_slide

                  expect(page)
                    .to have_content 'You have chosen not to identify any ' \
                                     'times you might have difficulty to ' \
                                     'remain smoke-free.'

                  session.move_to_next_slide

                  expect(page).to have_content 'Congrats again'
                end

                scenario 'sets a Risky Time' do
                  move_from_session1_1_to_reason
                  modal.open

                  enter_quit_reason

                  move_from_reason_to_supports
                  modal.open

                  enter_social_supports

                  move_from_supports_to_quit_date

                  enter_cessation_date

                  move_from_quit_date_to_difficult_1
                  session_one.assert_on_difficult_1
                  session_one.open_risky_times
                  risky_times.select_time
                  risky_times.select_recurrence
                  risky_times.set_reason
                  risky_times.set_strategy
                  modal.save

                  expect(risky_times).to be_visible

                  modal.exit
                  session_one.assert_on_difficult_1
                end

                scenario 'completes Session 1' do
                  move_from_session1_1_to_reason
                  modal.open

                  enter_quit_reason

                  move_from_reason_to_supports
                  modal.open

                  enter_social_supports

                  move_from_supports_to_quit_date

                  enter_cessation_date

                  move_from_quit_date_to_difficult_1
                  session_one.assert_on_difficult_1
                  session_one.open_risky_times

                  enter_risky_times

                  session.move_to_next_slide
                  session_one.assert_on_difficult2
                  session.move_to_next_slide
                  session_one.assert_on_ending
                  session.move_to_next_slide
                  session_one.assert_on_ending2
                  cessation_date.assert_on_ending2
                  session.move_to_next_slide

                  expect(page).to have_css('#smokingStatus')
                end
              end
            end
          end
        end

        feature 'responds to \'social_support1\' with response 7' do
          scenario 'responds to \'session1_social7\' with response 1' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            session_one.assert_on_social_support1
            answer_question_with(7)
            session.move_to_next_slide
            session_one.assert_on_session1_social7
            answer_question_with(1)
            session.move_to_next_slide

            expect(page).to have_content 'Excellent!'
          end

          scenario 'responds to \'session1_social7\' with response 2' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            session_one.assert_on_social_support1
            answer_question_with(7)
            session.move_to_next_slide
            session_one.assert_on_session1_social7
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'You feel that there is nobody in ' \
                                         'your life who would support your ' \
                                         'upcoming quit attempt.'
          end

          scenario 'responds to \'session1_social8\' with response 2' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
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

          scenario 'responds to \'session1_social8\' with response 1' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
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
        end
      end

      feature 'responds to \'session1_5\' with response 5' do
        feature 'responds to \'social_support1\' with response 1' do
          scenario 'responds to \'session1_social6\' with 1' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            session_one.assert_on_session1_5
            answer_question_with(5)
            session.move_to_next_slide
            session_one.assert_on_session1_8b
            session.move_to_next_slide

            move_from_session1_10_to_session1_19b
            session_one.assert_on_social_support1
            answer_question_with(1)
            session.move_to_next_slide
            session_one.assert_on_session1_social6
            answer_question_with(1)
            session.move_to_next_slide
            session_one.assert_on_session1_social10a

            expect(page).to have_content 'You have identified people who ' \
                                         'can help you in your quit attempt'

            modal.open
            enter_social_supports
            session.move_to_next_slide

            expect(page).to have_css('#smokingStatus')
          end

          scenario 'responds to \'session1_social6\' with 2' do
            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            session_one.assert_on_session1_5
            answer_question_with(5)
            session.move_to_next_slide
            session_one.assert_on_session1_8b
            session.move_to_next_slide

            move_from_session1_10_to_session1_19b
            session_one.assert_on_social_support1
            answer_question_with(1)
            session.move_to_next_slide
            session_one.assert_on_session1_social6
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'You\'ve decided to do this quit ' \
                                         'attempt without any help from ' \
                                         'other people.'

            session.move_to_next_slide

            expect(page).to have_css('#smokingStatus')
          end
        end

        feature 'responds to \'social_suppor1\' with 7' do
          feature 'responds to \'session1_social7\' with 0' do
            scenario 'responds to \'session1_social8\' with 1' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_session1_benefits_to_session1_5
              session_one.assert_on_session1_5
              answer_question_with(5)
              session.move_to_next_slide
              session_one.assert_on_session1_8b
              session.move_to_next_slide

              move_from_session1_10_to_session1_19b
              session_one.assert_on_social_support1
              answer_question_with(7)
              session.move_to_next_slide
              session_one.assert_on_session1_social7
              answer_question_with(2)
              session.move_to_next_slide
              session_one.assert_on_session1_social8
              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'You have decided to try out the ' \
                                           'quitline and/or the online forum'

              session.move_to_next_slide

              expect(page).to have_css('#smokingStatus')
            end

            scenario 'responds to \'session1_social8\' with 2' do
              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_session1_benefits_to_session1_5
              session_one.assert_on_session1_5
              answer_question_with(5)
              session.move_to_next_slide
              session_one.assert_on_session1_8b
              session.move_to_next_slide

              move_from_session1_10_to_session1_19b
              session_one.assert_on_social_support1
              answer_question_with(7)
              session.move_to_next_slide
              session_one.assert_on_session1_social7
              answer_question_with(2)
              session.move_to_next_slide
              session_one.assert_on_session1_social8
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'You\'ve decided to do this ' \
                                           'quit attempt without any help'

              session.move_to_next_slide

              expect(page).to have_css('#smokingStatus')
            end
          end
        end
      end
    end
  end
end
